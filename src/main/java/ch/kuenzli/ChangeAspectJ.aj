package ch.kuenzli;

import java.util.HashSet;
import java.util.Set;

public aspect ChangeAspectJ {

    declare parents: (@ChangeAnnotation *) implements AspecjtChangeListener;

    private Set<ChangeListener> AspecjtChangeListener.changeListeners = new HashSet<ChangeListener>();

    public void AspecjtChangeListener.addChangeListener(ChangeListener listener) {
        changeListeners.add(listener);
    }

    public void AspecjtChangeListener.removeChangeListener(ChangeListener listener) {
        changeListeners.remove(listener);
    }

    public pointcut stateChanges(AspecjtChangeListener notifier):
            target(notifier) && (execution(void ch.kuenzli.AspectChangeNotifier+.set*(..)));


    after(AspecjtChangeListener notifier, Object changeArgument): stateChanges(notifier) && args(changeArgument)
    {
        notifier.firestatechange(changeArgument);
    }

    private void AspecjtChangeListener.firestatechange(Object changeArgument) {
        for (ChangeListener changeListener : this.changeListeners) {
            changeListener.fireStateChange(changeArgument);
        }
    }

}