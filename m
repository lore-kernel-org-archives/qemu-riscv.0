Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvts1-0004d3-2V
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrz-0004aQ-Mf; Fri, 10 Dec 2021 23:20:23 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:55682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrw-0001dq-Jf; Fri, 10 Dec 2021 23:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196419; x=1670732419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=16jcH+x8/iXJ+CRqyPvXQNuVzkC9FDU2I0fzwWm56aU=;
 b=Am+m5TwzxU9rOwE19IPlohDG5d4gxDT3Y6eXvamOQn3LeQkTjvHx0cNK
 wZOMwC1CPahgmAxsLPuYwHNc5llPVr1qagbEC+8EbxR2H3hMqq4twXI9I
 sm8R6rZUlRqkrC5TLbzPN/G19Q+jJ/pCAQGVl065pQA3sPFuZTV6DdFoY
 XlziqHd58u86dHc/Wby8Kn6UCyuwuiBTwfik8bFXZxSx3JM5g9dJYbXXK
 Gct9uNEmF0N485bZ6SLNJC0n5nUxaWPTXXMntL90vn7hyBn+3nqbUjy9z
 24CBP9Ap1JUIW8W5rjWtHdnZE+f+qjgHvbMjMZn7B7qewUMBMTqYCfpmh g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="192773041"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mngmp5YqlFYTfCWG461pH+8dRKtcu2PKJ2T7StBLecTFVDS3nJ2lio2d9t/8BmIsJHWAGpbLYp/mJTNmu29k/wZx2q2ZYE12gmTGMBbFf45+bHU+CUtKOnmiTB0v0S9h57wHYTVNzBkpp7j9pDBM8+AAz9ThaX90FNr9H8DqCyHxRbgsb8FKbOl3sikn1GJSHBp5+VgZTTDBaDt8Qb+O9+sHRokeXM8E+xhmm0GfE+1H1ATfpwMAa2r1KL55JUjtTYCrComRQULeueJ3zP+ajbV9BCt2tmYdjqGzByL+71KvWNAwduX7jIhenMXk/5kUdpvhJxsbXTkpH66DgUqYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ta/6CSZ8C8fueanQlAmWbHoGGdaZyqopAIgqOA/Efc=;
 b=GK961Kl6occiMoedpnipJCklRgtqaBGc8aRSV8o3lFD5pRQFYMfo/m+KDPiQVd1OdjWF0ZiZQgpd+bU/SHpsCDiY++eIMfPbNzabKsWHbRt0x0+btO2ni5b4pJQiRs+Gq4OmE8+ZZ5a19TRQzVsMR/+KJS1ckoItVQkUrhfMhxSxwsH415YFo9GcIQKQSsegd5oYDuJwSzIsSMQfZAsy/bTBhHmrEAdCNT1JXcvCdu0MwkU3M0qCsW91cYLYPKyfLSdda95bfd8G/iaJ8itUNirl5Ey+gsFeSr6Iu/C6a+uH1736mHCgmwI1NYNjnj6dtXkGsvNPrviZs8ETfIVKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ta/6CSZ8C8fueanQlAmWbHoGGdaZyqopAIgqOA/Efc=;
 b=oicEQK8+3ES1TSZL99+/TBuMTrYyg2Jmb5Y6puuY/q/cR9ejIXS17Zazgfv7MttmosIpBLd1uEm9/IKl/lqDEQ+0b6SLBgjvN2PCQbbT65C0PixeAIykShtCyVvaPBks+CJRvK3FquUOqUdHFK/NBc1TbFwhUsLN6BWANl+/DIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:15 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:15 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 06/23] target/riscv: Add AIA cpu feature
Date: Sat, 11 Dec 2021 09:49:00 +0530
Message-Id: <20211211041917.135345-7-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee91a234-26b3-475d-063f-08d9bc5d87d3
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826825C93EA63E0C20FF319C8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3B7Z+tlaSn4mG9ysagsGXtpFD/aYcJOO4iX/6qGrvDxhKI3duI89shGScWxzWgSmlyfflOnJKnl8tQ7XD02km9fw6f8NE323yOnpC0RCgyDbjm95o/JNRwGr6KyswctL5H0ZODQ4gYcoBKo7IKBI/OS+IseWyZrhh9fVH3kbYTnQh7MOzb3pOOWY8ZGsBLZ6JKyLvN1ygfMrpLICxYbulac7pAi4oab5Nn9RNpd4NnW/oC2pfaOC27lTxpfZUl3RufaDnCtdznFQmY7hiJw/Y/wSSU0N1PDv9kdrn1Fl1nt8re4DCouCGEu/L3TLJIizW3tojLFwMFs2VZVTJ5MzRtNuI7lYYtyUox21PwivnLEO6c2uxYkNZRqT5bdy9BAsEUKka20Pi8Anw0r6lc4T189vhESTM5ma6w0mZ4y0JtVIbj2D9HV9Qf00j9fMXkZdJy03b5Vr1O8Pnk64YH+q8iRdGupuYraZsCLLqzW/+v4cpw4WGSB7bkUKb94sU4HinDu0KEidYc4Lly6bA3CnIV1NJclpMgyuX9n+XNjR6mvUY/iBTZgUv//kh+hySUm9oOMF+sNZUfnRK/HZIDR5qzWd3s8d5k2s23IPpLonAgXkhvhqkQfQ0xnZs7jZzZrRFgyZo7/IjaS4RaSZ6RBJLagHklCuHBjeoT+JW6gJVFLgDGK3xr3K2mPBu1uaFnL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4744005)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7YNF0rVdnZtzyNuNXMhvW2IwNb+Xk3k3LgdsxoF6Tf7PUnfcdXhb639nqc4F?=
 =?us-ascii?Q?G/VirFur+ytO7tx9w0i/BWzeW5GxMVIMrnzgsdKGFwpXFZdCA/5lmoXV09T3?=
 =?us-ascii?Q?SDDjYh+yrukuTT9irAHqvY0Q5dXxvtP5Rq8iLOcDg+4zL3fb/2B5E1HQaQcA?=
 =?us-ascii?Q?Lt2n9Tjr6TrPa2bP1c4homRtXllMHLcU2McvfosofyDDtoB8IOPx27gv9R/w?=
 =?us-ascii?Q?XrrgcRIpK7/QUrucnzzvPBfUnf95RGuNvK+gZFPM6FviA6BZtQ6ceu0hAAeO?=
 =?us-ascii?Q?Ypn6gkisodQ8/Rjpclu3DbMPYKmzGUaeY1VK9FjloAnNObd44SLj0JFfuMDH?=
 =?us-ascii?Q?6JNA48Je7UFU1ByiD3LcnbfVExVhXSKd2s6m5h/0mZ3aWWPSYUKzk0qPWhek?=
 =?us-ascii?Q?ZVmBwc1p49rkMiFtNYrFwVM7rXdmGV7/2MY+N8L2y7jODkK8F4tKTS3ndbtM?=
 =?us-ascii?Q?5BC6JoyG7uvmAoMCh/0dZhyjiqqyWFnuMEihOJSJ+14RfJ6If9aep7HBqMue?=
 =?us-ascii?Q?7wEho31NhkgmeXKIejt2fZhbvQF3H5lAma3CMOuZVKBVwBfahbHi16++cd0z?=
 =?us-ascii?Q?C8HehyraMccC3YuIW56/xR53i/L/Yql7vjlUj2HJMd0CW+npXFWIF3lH0A1R?=
 =?us-ascii?Q?EyvtCHI5jYK7FVLFPTPRT0DkbVvMklN+dB/R7WkVYxvhC93fuEJLQ2cSTOkQ?=
 =?us-ascii?Q?qvcSuI+puPpaE15u6yn4Br5EPd4gGNAEQ/CKqkS9rVgLfX5vZH9ERwnuDd2P?=
 =?us-ascii?Q?FKwglJaBhEzrJ8K2jhNLZSbVjdHTcIE5FXIJSvwuk/lzCTU5qV8HpmlZMZBp?=
 =?us-ascii?Q?xEJKL2BpqxR61CzJSdXiPlMs5GBwc2oBgZq4nwnYu+SVou2m1Es1IK2BdnsV?=
 =?us-ascii?Q?2SP4Rh8dWji/pH6SVSyz6cn6vGi0s6mv5MqAD6bQFNtDX6Kv513BzoV+SRq5?=
 =?us-ascii?Q?pxLB2eEksRsKso+unwhjvIkTu7fCX9n54JmyM/MN0WpK25MTTaqwVUFntpxq?=
 =?us-ascii?Q?/BU7mcaaFFaboqjRXAPGH7XLk8hhD1BjGgv8S0DUXr1k+g/JHSx4gta0dF+S?=
 =?us-ascii?Q?n84MfLuuzAWtIAKJBOrGrBDhxbLqDluZrHh9Zov3OJDjAHEmWktzl1CLAJ1R?=
 =?us-ascii?Q?EOsJmGEC8lRNsL8+jILxxkZ2U1e0xRjzHQgajTceCkrgmnvYfZbU82bt/cJw?=
 =?us-ascii?Q?ej6FCM38v6TYmYo1E0HqIqxZs31i9srjQrnKifUMHVstzuQEf0IwGUZQrLjE?=
 =?us-ascii?Q?2ejesuQ2v/4QCJ/5KRTw5M2bSdd5R5jqKpve/3i8+7W0gjghcB2d3zoVHK3A?=
 =?us-ascii?Q?YhyEIeazPeoTBjG7JvzIfZD/aIuWyGYHh8FUxc4mjN+l/TsWUsPkYn1LZIKY?=
 =?us-ascii?Q?6DVuBmcZwsOcGkd6f6Aki1oi0G6tNc3kbbNzST1DgYUfwLugeDY98eusDLBu?=
 =?us-ascii?Q?xaPz2kYlWpjjJhzzj40xZ4SF4uTRWT4QJ1y5E2qIcXQI356+pc28FbE+ZKEU?=
 =?us-ascii?Q?S7NhnHJ78dgKIgE00eY7envl+bBGJoFGoMoUa5dfwu0Kj0pneLN0LMqe03DS?=
 =?us-ascii?Q?kPpKLq02KTW4KVd56oBZlhHvXKKzz3lu0ZlseXtj+TGVfEftfwk9fIi1/D7y?=
 =?us-ascii?Q?zxko8JuBocMm6GyDgY68/1k=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee91a234-26b3-475d-063f-08d9bc5d87d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:15.1070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxJFLJ+o352FRXrHSDOmEA9PzgPtsqoQPpjfZ7Pwl/govNHhebYscpdsDtpTbg9FVrK+21uuwH/z0/nJGyKU2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Dec 2021 04:20:23 -0000

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 48637342ed..6e5b6acd44 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -75,7 +75,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


