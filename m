Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsY-0006OV-El
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsW-0006Ev-9h; Fri, 10 Dec 2021 23:20:56 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsT-0001kd-Kq; Fri, 10 Dec 2021 23:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196453; x=1670732453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BlkkmH3Qqoe2CvdNqWcrcRBZY7JHvDzwuKVGLXIPL8I=;
 b=HMJbPRe6xvcWwTdwrWKLUa95eHtpL4Swpe720syYgWwPYQRNIdWMdOas
 4HmvOZsujWANiOZm1cRIKckYUtKlh5knIa6ohFY1+K1b5JuxqLHdko4Vz
 MQbL7LPDAueq3uks2F55TDPZMFtjQll6usT2Zx3hmMXCv3GI2K/oQjzIE
 yqZJuEG+2VkZcQMx7zv0GdPkwaMVc4k8jlSKqyv9GwmoYjhSmdvcXNXt7
 qkqzhMByqbscdRdv2eOqB3BeO95VtYCf88H8aNEIN8Yr3aLBF7UJWd4Cy
 qDRzq8cDfLgG4K1OFCBeF7SO/PmR7mLSMuxOGBsOSWj02C+9VM/KnbuN/ Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834382"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVVr25qlRB68wxu88Dty15zcTmecT4aHHHVUv3R3tJlDDWYGtOrTAvvdKkr5Ydn/dXyuTWrLVk7I3xi50YnK5194wJ38CA3QMLrMP/Ywce5CWAKEPM7qam3lA4i/0sdUPUlhd5whqBR678CLJnSYVXixSHTVgqB2+iWrqjWsXMxkCCKGiC9rIGy1FpS1MQR2jAHFtLSOzuemerzDSm+rA3bpJGUQ3nx7d5S+R6gX1BOdSAbtdaOeinxjdq5YrXQh3stj+kk86hUMa1cDa7tl5E5i5nY491YxcJ+lfiIgFL6q6Drii7kG6lRgeHcRcvAVjABbuwyLBpse6Lc/F7QCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/WpKizTvuokegO3I2DXCYUcJ6CKYjAE6XW1wzbhRqs=;
 b=WN54pFbq30orDZydOg5lnnkWpvoOGRRlQWYFRHOiaNHou0yufTFwjqcGaZxHWVmv6Ragde3Xwpd6cjrkcMWXPvlx6h5SMrOamKwosKnB8gdVyz38u34xsuv+hGqsQvmq0YnNLByAfUkwZzF7HgnjdWC4qVTJGtGtT1ua2vo5Clzm/wwQKbyq/QzyyjGCJreugXaQ7WUkiUiK9ykYoCdkLkM4Cv0NVIdQkU/ZKBCznODHrQFvMhlY2tCxtAkQRNj5ucvkf3DRUAA0gNzzoCyFLxopdPCSMZOd/LAujj7UAkKAfJD0GgX8MIEHiNaTx/0YtoZLS0b1pKIeqFjJFXabKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/WpKizTvuokegO3I2DXCYUcJ6CKYjAE6XW1wzbhRqs=;
 b=esVQLeP+yA6ShE2sqYzKriNAuLuSEHEcfalnx+HschamcrmjAf7nzjtQQV7ayeRffAzSR8mEfQy2E+OwMzypyNp7+8o53B9q7YBFcXol89uQlPTDAgxEhJeDG7W9U8T+SoGgliuZF/QMaVgVabI8Kdyq2rW7YRm46R3e55anlnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:50 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:50 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Sat, 11 Dec 2021 09:49:11 +0530
Message-Id: <20211211041917.135345-18-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: e6a9a9dc-4c1b-48fb-84be-08d9bc5d9cfe
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB82681159A6D2143B871EE0158D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQKaebsuiwpViadfvsTyWMivRmrQtVG7bHHmgDHXqR/zXENagd1By6rRheAlC8L5cAi0pqqAvy4ShMfSVjZr4thQaX+tVHqTUb1EtejYfonDz2CF7royNrQG1CFowl8ydvemr4/xWJd8HjsxdmF5F8kYdxIJZhLkIaxz0weXJwbovYpisUb3/3rSzGG5VW7OQhAhOO8YJw6d8peorrwCp3TTHfikaSMyBPiQMD5YJZIFaE4Bfy+3FLovYjMvJqv1eqIngFWY1KJQVKzORaWZui+ANZ/SQKQy82aQFTWADUX9JLFblHCAiRty/pf5enKwZLWT1bRGze5bjLU0fQMPkl+Rq50XJj4wbxo2jd2g/BHc4en67nXR53WOs1ZwIwfudgkrSxWJoNiwahRGvf+2HJvmbuLEIeH3whaG7pBhAcSP+KuTUBb7HkGGKOqq8a9F6zdsC4BEAWLQBnyZv5GfO/t7B9eAyPs0PeTWAmonqmP3AaQS8wYG6z0vLrpaP7HgqqXPhxn3w5RfnYUutVppTEEe3Wub7VQruaBmMOvgPP95++hqAkf3s/6UOK0nSI7B0M0sEJ+sZMgvk7WXfUlNCFn9vKrSPbbXM2asA3fQFJRkIflqTyQvEjxAQgOh/c65Es0zCpkOoWGIII4ThGqnEZUUEYOG4iLKtT+OJCzUjtT9BY50j6pNbO9uMTu6ast5rwjN7hotc16x5yWTn73PxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oD9E+e4KQjYBJvYvpSBdUcqXpaUhgZE7gUmern9kKpX46rpsQdiJnjEUkVjI?=
 =?us-ascii?Q?yv4YOSN8KJqFeU91wSkXZFHNpIYYKRYh5WTh/2RaLF/AN5Qwkn8sW4pW9Hbr?=
 =?us-ascii?Q?aBvdjbiiyjh1ozWD9ZOJZHRk4XVRdEKQ+0cZ2RvdP63fOz+1sIgILyIUcOcv?=
 =?us-ascii?Q?elH1rEk1S/hNpxo25YlMlh4G8XSFCOO7aG8CK/35SvZroesBvqG5ZhCOoJEM?=
 =?us-ascii?Q?qGu0gz0DIdNPj2BG+bcYGvKVsiNDqjJYzKkNaEF52kkfUSMHn865lnm4LaNg?=
 =?us-ascii?Q?7t9IrjLBNZUKBrAPJR8m6SOTd3hvfRd3MUGFSVkhrI5ZiW+RZbXtOgtAVrbz?=
 =?us-ascii?Q?ZK/f3vZJ2S11qm5Lk1k7Omn1L9zIs+UQ+2TxVK9smpU0ZQZIY5ncJaanYxEm?=
 =?us-ascii?Q?eVlG1043xyQ40PT3bZ7301JmQJbArNY+HRlj1BCBrr02KdeRudB1M9lLYHg2?=
 =?us-ascii?Q?Oli+blqKj6PjdudyNZA4QowCfuR8zceqxZ4Cl/uYT26jz9fv90vVSQ3QUKDL?=
 =?us-ascii?Q?EKl+x3RBRPjGryA0bhRgKu6T2bNYYU0dRM5Lp1v4zC2hrM7DiWMW2kQXpR/M?=
 =?us-ascii?Q?cRabPIxTTX/prCwga83AEHs6Xv1r1S0rQpNQnZI2LCp3wv9BWhYLjzLIujin?=
 =?us-ascii?Q?j+/Pty2N04LlBgxfo6zQgotX7+Mg12gh9rW7VG+CDx4068nJAbx9UWTu9tPf?=
 =?us-ascii?Q?nheNTe/QCVIZNztKlrJKzbWw+RaGFcjbZ0OUTE8+C8pDBK8A+zNPdKJrIN0x?=
 =?us-ascii?Q?if7h7AZKGBie2hr7U6++6gZOf1vbhuJ1FlrbB8iEJnXKEKDB8teB+Yxt2U8e?=
 =?us-ascii?Q?0fmfWIGYA2Ah1Y2hyqBs15k6+eziuPk8Pl/zOaSY3/7SmMG42AapIWI8mp35?=
 =?us-ascii?Q?wwkMcFGChbBPByaBZozi3cnpgV535tNLBLb5Pl7rgyw/M3Ycx9infuK6r/zu?=
 =?us-ascii?Q?NbX2FT4Yhrkp2Dg2aF4gitbxE54xJiO5czNgeGn/Sq/lABHeoOirMiOHmYWa?=
 =?us-ascii?Q?lODtLh8wAgw8wf10YBxqgUgxC4iwDlN2EF2NN6LQojkraRpwcUq+bVX/1Zb8?=
 =?us-ascii?Q?KVSNboxAyAnqAA7pqoOp4nmaBGVuk0BlaHZx21QPc81SCVL5QXKtyDu5Spyy?=
 =?us-ascii?Q?nqG2IU1Kk3WHpv4K9SJZRbbRkoO5dvCb5w3p9WTmAZugSqKM/6pacC2H09Sq?=
 =?us-ascii?Q?9KA9GcZ6saNkAAB2MLXzSBhSa/5Xes1jO4Xa4I1Os/ijN7nNvZYT6Nb1OG0X?=
 =?us-ascii?Q?b0xVPVOCZ0Tox3PcdlmdufRG3700zAEmYQs1s5EYL4i8bUslGFVCSWNyBvm8?=
 =?us-ascii?Q?kpAKB1YTkpOJGb3e0X9ZiuRBegedlYYw0VQDjBaQCxjAY3Ui09qDj/ksC0qY?=
 =?us-ascii?Q?MuAr9XBvzSw+IkEB1xjhbV42hwl1hprQgp64JIhc580ntsT0s7CsRbR1NNIY?=
 =?us-ascii?Q?wSBUHjc4TvWDOx6WOUrTeH8rzMecAQunDpOH93OLkJHeCZaERMVNX6GlMpjV?=
 =?us-ascii?Q?YQn4JX6iols/En7dsQQN+KWo08faGv1oSnYciDo+4HpHFHRp/H32hEjgiPPs?=
 =?us-ascii?Q?dExHatpzqr0HZc92i7XX0J5dZafgBKI+YlWW23B12Y9UIAgxco7fxCel4bl8?=
 =?us-ascii?Q?TLucE9Sef3ABkgS9FmtEcGg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a9a9dc-4c1b-48fb-84be-08d9bc5d9cfe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:50.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MTR5uKLGUQhPRf9CTXFM0/DE8zjgN0P8fWmDXeW8CetnC/rtn7mdWPL9St2Z10ras5wvst3vUxVsorqzCWBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:56 -0000

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 916319afcd..4042839785 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -463,6 +463,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -689,6 +693,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a43e38dd2e..d03a90e277 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -357,6 +357,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


