# VON Network

A portable development level Indy Node network, including a Ledger Browser. The Ledger Browserallows a user to see the status of the nodes of a network and browse/search/filter the Ledger Transactions.

`von-network` is being developed as part of the Verifiable Organizations Network (VON).


## The VON-Network Ledger Browser and API

With the Ledger Browser, you can see:

- The status of the Ledger nodes
- The detailed status of the Ledger Nodes in JSON format
- The three ledger's of an Indy Network - Domain, Pool and Config
- The Genesis Transactions for the Indy Network instance.
  - In an Indy Agent, use the URL `<server>/genesis` to GET the genesis file to use in initializing the Agent.

By using the "Authenticate a new DID" part of the UI or posting the appropriate JSON to the VON-Network API, a new DID can be added to the Ledger. A known and published *Trust Anchor* DID is used to write the new DID to the Ledger.  This operation would not be permitted in this way on the Sovrin Main Network. However, it is a useful mechanism on sandbox Indy Networks used for testing.

In the `Domain` Ledger screen, you can browse through all of the transactions that have been created on this instance of the Ledger.  As well, you can use a drop down filter to see only specific Ledger transaction types (`nym` - aka DID, `schema`, `CredDef`, etc.), and search for strings in the content of the transactions.

## VON Quick Guide

The VON Quick Start Guide provides the instructions for running a local instance of the VON applications, including an Indy Network, an instance of TheOrgBook and GreenLight. This is a great way to see the VON Network in action.
Running the Network Locally

## Running the Network Locally

1. First, install KOBMAN. Once it is installed, run the following command in the terminal window to install von-network 
```bash
kob install --dev tobvon
```
this command will automatically install the needed pre-requesters and software’s needed. 

2. Once the setup is completed, please check the von-network folder is exists in your local system in the following directory path 

```bash
user/home/von-network.
```

3. After that move to the directory where von is locally installed here the directory is “user/home/von-network” using terminal commands a follows:

```bash
cd von-network
```

4. Build the docker images that will be used to run the Indy network containers (this process will take several minutes):

```bash
./manage build
```

The `./manage` script has a number of commands. Run it without arguments to see the set of options.

5. Once the build process completes, you can test the build to make sure everything works properly:

```bash
./manage start
```

Monitor the logs for error messages as the nodes start up.

6. Verify the network is running

In a browser, go to [http://localhost:9000](http://localhost:9000). You should see the VON Indy Ledger Browser and the status of the four nodes of the Indy Network. All should show a lovely, complete blue circle. If not - check the logs in the terminal.

7. Stopping the Network

To stop the scrolling logs and get to a command prompt, hit **Ctrl-C**.  To stop and remove the network persistence (the Ledger), run:

```bash
./manage down
```

If necessary, you can use `stop` instead of `down` to stop the containers but retain the persistence.
