class EntryForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: props.entry.content
    };
    this.handleContentChange = this.handleContentChange.bind(this);
  }

  handleContentChange(e) {
    this.setState({ content: e.target.value });
  }

  render() {
    return (
      <div>
        <label>Content</label>
        <input
          type="text"
          name="entry[content]"
          value={this.state.content}
          onChange={this.handleContentChange}
        />

        <input type='submit' value='Update post' />
      </div>
    )
  }
}
