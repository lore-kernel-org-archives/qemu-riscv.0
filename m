Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrb-0001Ok-4d
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrL-00015H-5B; Thu, 02 Sep 2021 07:26:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrI-0002sH-CD; Thu, 02 Sep 2021 07:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581976; x=1662117976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UkxCuGUhsMhhbBJJgukw7DDSCE+VpActSfaDRb2M8Ew=;
 b=KT9KN6CsVSV/yNnj8eRsxC3TQlPzNGUQUS8iQGjFq4Iclss1gJe3HHbl
 aJL9FUzRPaeoN0TDbWFFR5TVs1ltEl+2niMdr1yaJU0Jg0KvJ8p16Mjue
 9yON70fGq4RSzgWSZaD2bfE1tFS4eIXZiWb+N48ooWbTshGFS5UbCJlbz
 z3t1NZVnuKzAY0HzFB3QPQRV2dnZSGFWXZyLEwVFwkB90dkNjSAiVEhEX
 rO2svkK+o8vhtREHJpCwwdhm92GyHiEIbmQv8vUjToxpUNwWX8KP+mEFm
 zouEc+W0w3jY3RqkcjNwMINuX8lwHXxL9e+tnSvx73OSwRrUrV5AxoxZ+ Q==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179039146"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hwql7lrz1Lzl+p9mNcIQ/bpC+nJizm9bsEMTkGxexIvpuWsfagcPWVt0DOtBn5Bge7bsD50de+/XjDIK0Qlh9HJgpeLDW2do1MLfEdQe75JDsAT0KWAQ71IkJdMagpbdeun3JI2hFN+lNjiiZ8HCXLfN7TC9GSv4GmtyFMkXkAzko/qzUcDwUPozMZhqg7DgeXHM4VvbjzcgEYsspXmqzOP6EhPtG1SixYOkkt6ndvBDFEuDHKTyMAFUuQijKhs4wW/9xMw7Xt1NYAUALvp3qAAR3+iIESMIgzNTJKU8VHI8C3i1TdCl89tN5BH+10JLSO1aGNn9H0YtUjyUT5azew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TQIguzy30T339/hVi9tBCjiJcpk19MNE6RBZmgkbfY=;
 b=l0MD3WS8VcWGJBGinMdsf1nSqDVXkaPhxaBWJCcbR5L61WHiug0dt9hfDkoJrEq7Q8bHsmgnG37DjylDAxA1VqN46YgC/oGpjbFw8al0sHnwPi8HXvm/N+wygaJzA0ZBlLIqY4q1b7QS863Xe/9oRsJ3R+75JJQvQfQCB/lIvPJ8ObnkwvoBpxq9Ey0ssWB6nJawykNIt/kvOliFFvL5BO5vnfInvSw7eMhrcvWllwFgD7Sxx0dIzwduFnxUhoKDY93hoFLn55uiHHRWKHzQJtDU9gQmb33huTIhWs5Lf0VR6DtZ1l5DOHvf7k12u3LaQW445jBVj2b/rY+gxtwJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TQIguzy30T339/hVi9tBCjiJcpk19MNE6RBZmgkbfY=;
 b=O2cQiY7540nzrf3FL0w4YIsod3+zgdpwtvAvTww0JCMKQu1ejhdEVAkgGSlfEiNL7+xfZxdTgwTqyN8L0RTqXsrHHEF2x1DrrvZJ3mI3mZO5nyWhSC2bHyK/xmR3q5mUiEp+OS/Psm4pfnznYej3r9L6QDVbh0mU1Qrg+RoIRkA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8361.namprd04.prod.outlook.com (2603:10b6:303:140::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 11:26:13 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:13 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 08/22] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Thu,  2 Sep 2021 16:55:06 +0530
Message-Id: <20210902112520.475901-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
References: <20210902112520.475901-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0464715a-1bea-408f-0cfb-08d96e04787f
X-MS-TrafficTypeDiagnostic: CO6PR04MB8361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB83611E94D3387660A0588B638DCE9@CO6PR04MB8361.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: neO2Hcvsf1Dt884fbn3Ccl2UgJOwyovfIop+2WgNUjo1Ki4JIH8yhjks2wrIRqom8JRxILT/VJRJhDA0afTJT03GcJGp6Jveq2CBGWRwlMarVlARvXSQ09e4w6fs1qn6VJGY+HoINWZTG3WMpm+GxIV8qHX1xubYpHYTrL61/i8cOvprB31/j+uORg5oQ8JOfCPCm9dHM2rhlIVW9KGJsTsXVmQoFnP27Yc4P6z+IREqv5cuF4x3bwI/6aVNcX4Kr9GNyFqJ8WXB2GI6iMbKuTBFNmmY9U5FgzO7mgPpR0rdg4Pn1deXz//YxWAQJ/PBpwLa/ykmxiWng7etmQc/gDlEdXMujWintQ1rphW9BK9UMGLC4WQRyv69fNlh0pfPl9daxhs2amm9i9xZcuEG2ZC0RHtHQKNmWli7clN6/xae+XtFjLrPm6XGP+/HPJowV4sKo8dVZDpo907YxdKoGftW6kinNUQKll+7KeszaqzFxNmGaoBsiVuWmGngKh7fQuP4S1Ywlb05QR59q8qVzGU6tjCzBFri+KAlWYWfm+PgAJ7yCBmodrzAGYvfQyhd1OoLg83fNzFS4Sotu8psrmtsM4Q2M58agjzGCYsj9FBmLtaT4rLjktdI8B6iDxddyHRr6Xvk+nYVTWA1hBHbm6TDqhygQ0nN/Y2hhss+cVlu5aPdfkJe6O6Eoa7H8BDtQh9UPWFPgwA9TdH2q97gtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(55016002)(186003)(1076003)(7696005)(86362001)(6666004)(52116002)(8886007)(36756003)(956004)(2616005)(83380400001)(110136005)(316002)(66946007)(66476007)(66556008)(26005)(54906003)(478600001)(2906002)(5660300002)(8676002)(38100700002)(38350700002)(44832011)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EMDvgJKPGfstLUFBhWqpE7mLhizfNn4vFAkgKKp/NNw1na5CEGQJG2ew80PP?=
 =?us-ascii?Q?U+FDcHOSMUXq9FDk1vfotU0WHJajOkA9zStisUazXIHq8GIVDWL3obIhLYKL?=
 =?us-ascii?Q?JstYBd2MQekUaKWxdBkrGAMP/y0D0FZ6OD26M+MpE46XYg+JsO+zj1SbdK2s?=
 =?us-ascii?Q?8cMSgwkg6gPZ4yfmfJDKVL78G5fLQlPd4aS72wtIQEapEZ4J1lHdgw4pYrpA?=
 =?us-ascii?Q?CF36/82MPmj5RWthcjRX74s4lXe3eKMNIz0XSuc0DPoV7g77ZoaiWHpK4QN4?=
 =?us-ascii?Q?Gv4JesuWl1d3zFPx0RS5Da+OZcmVwM0uAWFZqCwXsYQv0uUcuX+8gGAhH95x?=
 =?us-ascii?Q?IeSny+r8gndVwdg/hsaQEDhGcw/s7lY/+G0Zp6jQ659gmrSctcg0jGNn+wHS?=
 =?us-ascii?Q?6HuyVHESSY1FKtu++n8+fEXhC15ccIe64Cmarl/rTTjUXIjVAluGVyOlpeX/?=
 =?us-ascii?Q?nEhTNO/bIP++BHF7X1gRPuA2aEDkbhRFytxruzaUosctRhGdoS1Khzxy4p0o?=
 =?us-ascii?Q?sAXk3EMMtkfDX5tqSDug5C+9Y4gAPDXYg2zUuSszSOL+urJB/X6Rbz1TnuBL?=
 =?us-ascii?Q?fnlWOOowXrasg2vZ5EuwMjN0K9L5mIxftSkn6PP3ZvVti4IsqaMfHt/H9GEI?=
 =?us-ascii?Q?CauJsNVNFK8fs4qKTlQFFvzFTMUJQyGE7JJH2+Ux/i+MUNXdfn+2P2LYukhe?=
 =?us-ascii?Q?JvoEKwIvXU8a5FDVAeGJYSGCUmVcAdd3O3cqKYvg2OnIaf41sOBqwmaIBxic?=
 =?us-ascii?Q?Q7SPUtjRV1/mnk/3RPOGwoEpK1lT42X0nOOTZDuwDMEUl1gIfVeIviErP7jU?=
 =?us-ascii?Q?TjwZ31K33xdqslVj7qxhFsY67h1AMCWQoE/FIn+sAS644zXRFhd0oj0s3LZ7?=
 =?us-ascii?Q?SO3dkLJefQmV8aoH1xxlnOxQYIjW8tTpVF005i1dzB9QmKaY0issv9eIUp+0?=
 =?us-ascii?Q?v76ED7gqtpxtcr2T/0/P2+iZKKHLRTtiNJoizVIfg6apMjmXGf/mheIE/uly?=
 =?us-ascii?Q?gBBKNwvvwepVU0tODiyuyS+TT3aM2ZmapEPJSq8s7BvchuP7MegmUqkRtw5E?=
 =?us-ascii?Q?cjJHf7tU6/AIMkaGvReOLU2BSRG+pFxDi8XcQMiDMPGSCO/oiR5qaB7ya40Q?=
 =?us-ascii?Q?nN6PslswgpBHFOM/aQnFEvRm7bVaQf7tdNbGTvKySoO4td0chAC4wCcd3AbR?=
 =?us-ascii?Q?3qN27Hsk8+JRokmP5M6YWcP8iPXoRuRUZolprnLo4Eeb86mIbVcpjhlsf4fI?=
 =?us-ascii?Q?MwNjlAJnOxO8zyZP+q5KYhr6krEKt6DGB9fxiwJDIcq/zG6dmzgiQ56uTSUn?=
 =?us-ascii?Q?NbAEzv8jMiUVujx5XGCpDcca?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0464715a-1bea-408f-0cfb-08d96e04787f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:13.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5Gcgmfcr05moRjEW6x/xVvvtkmR2kP8Y04VC4MeJphCuJeVFJaZrwGzVgnXNICElRfHWX9tsb1Xm5KkQgD0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8361
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Sep 2021 11:26:21 -0000

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h        | 19 +++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2cde2df7be..c5cdd26de4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -239,6 +239,18 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein) \
+    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
+     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 20) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 24) & 0x3f)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 #endif
@@ -379,6 +391,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ee316db594..fcc8bbd1b3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -288,6 +288,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


