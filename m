Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6943ECD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:33:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkO9-000150-OL; Mon, 22 Jun 2026 15:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO6-0000xG-1g
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO3-0001uQ-9x
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFX9vl1591745
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F7D8VHI79dV
 67Zew7czHHb8GjJNhn3Nn4r6Iq8m8kRk=; b=MF01BdQbKM8u+mJ6PLIPdyfwOeo
 2oW6IYJD2wWvEnMLJmjBh2mqgXKiQ8qvSW+rfSS368n93rf6Pk5W0sZan5Kn9/ow
 QURV8n+fIQn5PAm/Eoxy3t66Xi+XJj1XEKEoN2D1otrE09mCzeoW5OAtsWhv8wVw
 OZkZgJBCYvip29a4tLtCzdTPiwSJ//SeR+83Ie0sYpKW2OlwdRoHBc4qbfpfWFjp
 hc2KIrASCQpuroPcg2uSwQ82aMKAjUwZjNANMlYfaZ0oT/RWqs58mKD7KVFCeDc6
 97PrnF6QRLcrvdIjKQWkMntMEcUF45hWK5k6aWxgsxGcEa8G+iIUdOgy0yQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41dxa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9227d9b3b5cso605350485a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156768; x=1782761568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7D8VHI79dV67Zew7czHHb8GjJNhn3Nn4r6Iq8m8kRk=;
 b=X7+nctbQPiwLG486c2770bGtwhWn7q+bvAbbVT7Zjt8QS6q0L4R+rq2agyqbw1lEwa
 FqZTSd8K24fHMZX2vwxyNZbDX4ThQQYIdX0d4yVUAG6MePC/914T3OSiuWSyVcTjCCRX
 lubmv53UlNqrS+nhufjxbK4+aoaWCpVND8l+aGgmXE2UB3nGEe2cMH+E7nLclQuploOf
 LBjGo2ezZPXwaxHxz2ebU8/+Cb7TT/CS3JwEDGCHu/cox9xaWwnLk7e0G5LBQbCrquke
 On8frwvbizTiM1YU7cU7YSXVqwOhPeGqmju2NnrkYrPcAch3tRSJem6H3XOfPY15tyLd
 CWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156768; x=1782761568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F7D8VHI79dV67Zew7czHHb8GjJNhn3Nn4r6Iq8m8kRk=;
 b=PrpqfQh20xmtSviz/KBjCDjCWgL9eBHRxwozfeQ248/VLOaIegSJ76AaV7/vSHnClV
 yRTz48VcmjrxDBDXiX6ljB3ExYwPkgaFsayKB6xm6kXtNgS6BZLuPr4Wqeh2kTzfcwpC
 dZI59UrEGZYFoU+j1mj+CA29hmTvrBBGYFtndDOIj1f6RRG0JQfYGd+G/OsVl7Y3KxZh
 EWKB56EWKwCjyy9+Ypo9S5qhbUG/FNnkuq2r2S4aFftaI6Bxxy04mG0CjnNoqd7FI7oz
 EmNmGTodeQfRViljAvLyyiY49qsk71CdMqATMbm1mTI9fwnBonkg1O8fnw/5ICCKRR0y
 YXgw==
X-Gm-Message-State: AOJu0YzR6KG7cUBRTqg2KEhnu7w2gkSWcbUmbT4ZyC6opfpPNCcKUga/
 cUXGU2FyIC3FwiMkMa24+oAlgLTWySYiCZViJIFHnRS4oAV6j1kiwL/kPv+XRM1SKHnR7Hxboyd
 1fLle9keT8ht75m6aqrrFJQTginjhG2Djf3zQA4MaVXOUA1UiyYf97JmUag==
X-Gm-Gg: AfdE7cmKiNs7A9ZVdQW6tUeFK9BwB+1n3DJqvWEADPZEcLQjWdQccMr6ldJFP7pTeGo
 +4W20uR1Q4y8B9YOfXb+uueqLJ7HbF2sJ90JUf6bl2MkUP2w9rxzpFY3UF3TwK//y7e58QNWQRE
 pYWVu+eidtZ6vAzCOgrGpcfDWN7Z9Hyiazrp+J9tQhgUikPk/TCBeQe86IzFOK//QszZme9lH8n
 FfONE03eXTVUqPTtjt5FrXlRUx6AGnGMDXHsD4r1GSCFuiq1yv1zNItLMnRqKTVYaXQbQoYIDG1
 s9+Wb/bITP0WKAbIBqxxlkzqyKbzru1Q0QPta3aJISy4/NJMIwFEtJQob+MvvIhZvDRW4WVjXSj
 9fPEc3TrahAIDLDnwX3NypU2DrJwJhDZs+dM0nt2xgn60yA==
X-Received: by 2002:a05:620a:2701:b0:915:cda5:27f9 with SMTP id
 af79cd13be357-92092e37e1amr2249683685a.56.1782156768406; 
 Mon, 22 Jun 2026 12:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:915:cda5:27f9 with SMTP id
 af79cd13be357-92092e37e1amr2249676685a.56.1782156767944; 
 Mon, 22 Jun 2026 12:32:47 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:47 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 20/24] target/riscv: move riscv_cpu_set_rdtime_fn to
 riscv_aclint
Date: Mon, 22 Jun 2026 16:31:36 -0300
Message-ID: <20260622193141.1449724-21-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXyDCpkzJ3tTve
 qd3gyYyErjOXfOyQi9ZmEcKwSYGnQHy/zagOTyVg8/FeAHzc/pXGCuqwGslSTIK+cs3Nymm0rxS
 xWqazc7AX3O1kei+4jd6nNvEhd2dLp8=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a398de1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=u0cZ2EjT8PS4VQJ4ig0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: q-ZUYzvsRFHmpE1L7QxBDxZ7ShronPGc
X-Proofpoint-GUID: q-ZUYzvsRFHmpE1L7QxBDxZ7ShronPGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXxfjzvXeMl/zl
 gPEpcJxlG4HWBP8b4JZZPFeTzAluzcHvZfdoJSEYlbxm1fwZmTNJ5a7Wd4dyNT5wpwmT25CCdeO
 bpx66905BK6FxHPR1QhWs6EbsC837aCN/alKh0f9A5QX5yeA6gMVR4SljHml5QDUAqSPEzhlnhj
 2sPdBnLDsP12pjz55VXnOqeqSnpc1O004oGIjfbd4H7ZDaHomTikYjJK1BVw+Kphuh2FSWYG46k
 hZApRaJA1SdKFaz+Ul9r1suCPfcctM0hYaRPsHDY0XMTmj3/qzz4jTFqUJzD2l0fj0XwfIPFx0v
 txcwC9I/McJJL35WARWOfs1wn8U1qcmzgUyjMA/qe8lZWoZjs6j4p5TVp+8Rzdhih8HFIETZJBS
 gj8cm76WE31sv1bC6ue7EGfiTVtMAK30RHbuSUpOxWBvyd9/VcTmfuh3z7egilLVESkNZ0A8V/F
 AasoT+RYkAbCRRU7A0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

There's no need for it to be in cpu_helper since riscv_aclint is the
only caller.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/intc/riscv_aclint.c        | 8 ++++++++
 target/riscv/cpu.h            | 2 --
 target/riscv/tcg/cpu_helper.c | 7 -------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e27e5fb394..361a8d1bcb 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -40,6 +40,14 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
+static void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
+                                    uint64_t (*fn)(void *),
+                                    void *arg)
+{
+    env->rdtime_fn = fn;
+    env->rdtime_fn_arg = arg;
+}
+
 static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c45ee228f4..9ec86069a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -679,8 +679,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index f99fa636c7..d0d74c3597 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -612,13 +612,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg)
-{
-    env->rdtime_fn = fn;
-    env->rdtime_fn_arg = arg;
-}
-
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg)
-- 
2.43.0


