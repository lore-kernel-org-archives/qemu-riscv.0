Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15ADCD4F26
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcBA1-0008T0-KH; Tue, 23 Jun 2026 20:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9m-0007xY-AK
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9k-0003N9-Kh
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:54 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NJxeYW3456218
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ouV5MqYWAmtAndi1dcMkZCZv9z3hKC7UIjKZVhs6NcE=; b=ParsgdvWNuuaRbiZ
 NJBi9+e0qERwpJ7LgRdp63uHd7GNu+x6VwOrLXhs2uCU3l9KucfpMtU4fcSty2Li
 d0YlRyTyIyUj/VGDoKXey10vQZmG7t7hWWXccxzu/O6AGylCQh/BYObDnF4dfnzf
 LXDr3IvqlHHcyfLul8N1gOuWLl6Oy8hcfflakaR0P04p4vepZORmD1AIKAAChzzj
 3iyck8uuyOlRNVyjs1r7ayGAEyeYtZuY/vzVeYAYXHJkLSs++G79BGPGTp5U/GCh
 hBqc7R0G2Q0r1N9zka+2AxO0R28n20Lebz7cf3UmuR0XpagYwxCTWC75z8cDHFsu
 Rqc++Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gurag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8e0df2461fdso15079596d6.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259670; x=1782864470; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouV5MqYWAmtAndi1dcMkZCZv9z3hKC7UIjKZVhs6NcE=;
 b=KEMq0P4/yiselAFysq/e0SDZ+vCVBdfh35SNAO0we4VwGg3h7Z4Y7xkv6a7vENdjYk
 7WkrdNaAI0WG1H5e9htanLmrUFunf1KSELzec/JnWCgO21H734d0lWrHLhdSwULfOqhU
 as8vBs+jUOZFmalu/vz/Y7zqJceZAu9TCOFm76P9zXBTF7UJAjJ5HghGE9Mk3lsxfTdR
 OS/SFC9uLgpv32/1hWeRdR+BxvYpBhp3eb0Py1uyl3D7hzUoKsfarLDCEgKVZkh9FUhr
 gRGBeqwH9xUjRHyAxF2tTYEBB5Bp4l+PxmOhACGM+co4emsJDcf//tkiQ2kS58hOgUps
 D/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259670; x=1782864470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ouV5MqYWAmtAndi1dcMkZCZv9z3hKC7UIjKZVhs6NcE=;
 b=EdYQ6NyFxt5/S1oGY7WEwk0avIMz1CHihRPljh4B24dMzz1YA0ERPXUJwh2B0rjGLp
 ue0Iqgo30VfhS8RJA1kN6oeWhdYFhyl2Fx5P/wF8dB2agNGgwhQtE/ibw+ita2LRxcZM
 UCbm3XYVN9VAfIEwYNQcsegzTWBYqzLVwoag9IfkXU5mLJj4guwkIHnO4gZn4QJy9MKz
 2t0cYkjAhidmQa0hrWdrqorh+v8Tr//QuwIei8cdf9+dvUg02m+4zUgeizcN3Rt8jSpO
 g/uvfY9IxaBoftW8qvjGpuEctHcDj0K776hZVfanEHavWW6/E4GUiAynnFz5DFgeFB4E
 z+uQ==
X-Gm-Message-State: AOJu0YwBKz7nPLecRehidXori0VlbUI3ogmf/WkFuGWRod5IM31wy3L2
 2xsn0rFUdywBBOxccwSjrPA5lb2sf1LheqlEfZPtXE/1LIe1bIAOgGdfr1aGYMsF5qM9ixxVy4x
 eyDsEbkH7I1hKmMl/ltWYYMp1uqmXexUSfk1UvUYzW5gW1rgsdTHX4zilog==
X-Gm-Gg: AfdE7clNjJwCGfIkAretSmGOAJYingOgkNf7lPoMJLgdsZBuJVEFJRFQ3SxaNfF7WuG
 f4ktjTG53deLKBL6i+sLzuWpBrbXnOl103qn1E75OSD9NdPxOtEEw+dSIC/JvLUAqAbwURT6SEL
 pXbmNZkuys3FGMgHH4aphPF3zPeb7NF6vTMFjbCNaa0AMol4qVYBmoM+v7JHpM90Aw2HWGB1fMc
 GdOMeq9OuLWwPlRI82+h4yuZfJ8KMRYuGuDQ8lejNHTdatoK2EizuKJq+OJkvAO4EIestA8Xv7u
 OQ1/XEkP8v7SOAtJBRUdaw40G4VvmZRIjxvthvfrBqP76tIa1IIazr/GMOpwpCiU+cfdjjx8fOL
 H+rCoEMKCbUsuwnAiwAv0yBjJMmbcto+l1libGJJaLXXIBA==
X-Received: by 2002:a05:6214:130f:b0:8bd:de6d:c340 with SMTP id
 6a1803df08f44-8e52fda08fdmr26382756d6.26.1782259669955; 
 Tue, 23 Jun 2026 17:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:130f:b0:8bd:de6d:c340 with SMTP id
 6a1803df08f44-8e52fda08fdmr26382086d6.26.1782259669340; 
 Tue, 23 Jun 2026 17:07:49 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 23/24] target/riscv: move riscv_cpu_set_aia_ireg_rmw_cb()
 to riscv_imsic
Date: Tue, 23 Jun 2026 21:06:30 -0300
Message-ID: <20260624000632.2149359-24-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k8CSv0tWvIfZSDI40rsBro3dpvdu-1EF
X-Proofpoint-GUID: k8CSv0tWvIfZSDI40rsBro3dpvdu-1EF
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3b1fd7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tRk87D2_djSq5c8C55gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXy+yNB71kTEkE
 FAdV7c4k4sC02VOoaUGJPvEz+hASRu0wjKz6wg9NpSEJh277F1EU6P79dtevqQDZhzaXJf2Nu93
 GYQLkJkJxwErp4LJ8lRtn43qjk8K1sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX0hAgmXSg+mdg
 CP7aHG5cjfvMYer+lRxGVn5yiQaMsZibbL4vGY+qxC2jA0eNbKwSYPZi3q3YwCUykdq3D0iuCrt
 TScEtY8XVnRBLxmi7b+s501uqNJBhAjBWzzc0bu5NrvRCcOtxLI9rDGY0nudIdoH6/eHWsA+Py4
 JF9V/gLSGhyELAi0ZXvb2vDC7TD/sd2sS1pq79MljhdCdSTniUQ8Nx24rGI0XJUWx6ypcutXZhz
 xbtsPGNbgoMZszAhSOACd9wiA9raOZYiOk3v5a0T6/NdYfMaMs6k4KsBPGpQ6pJ8IZaXtv8D+Ql
 vvOzCYEtvWhwsQaZ6Z3BqbSJwo0dzBp/f06gfvJVACLcWOx8QOwsHTpLntiJDGMLDkaoBLHxqaM
 ETZODsXzUucu3lsQmsqN9s5NPb1EFtrQcIVRoQC9xxI/zJbDqsiMlcJRdEFyon3PcSTCd2WmJuU
 kHYDbo4H+7I8+/xn1YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

riscv_imsic.c is the only caller.  Having it sitting in the TCG only
cpu_helper.c gets in the way of --disable-tcg for no good reason.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/riscv_imsic.c         | 11 +++++++++++
 target/riscv/cpu.h            |  3 ---
 target/riscv/tcg/cpu_helper.c | 10 ----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index ebb55191c7..d6b46cdca2 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -376,6 +376,17 @@ static void riscv_imsic_reset_enter(Object *obj, ResetType type)
     }
 }
 
+static void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env,
+                                          privilege_mode_t priv,
+                                          aia_ireg_rmw_fn rmw_fn,
+                                          void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_cb[priv] = rmw_fn;
+        env->aia_ireg_rmw_cb_arg[priv] = rmw_fn_arg;
+    }
+}
+
 static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 {
     RISCVIMSICState *imsic = RISCV_IMSIC(dev);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7a4d8abe07..c9dfa7daff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -680,9 +680,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
-                                   aia_ireg_rmw_fn rmw_fn,
-                                   void *rmw_fn_arg);
 
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index a5d864cd24..e0306d5d95 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -590,16 +590,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
-                                   aia_ireg_rmw_fn rmw_fn,
-                                   void *rmw_fn_arg)
-{
-    if (priv <= PRV_M) {
-        env->aia_ireg_rmw_cb[priv] = rmw_fn;
-        env->aia_ireg_rmw_cb_arg[priv] = rmw_fn_arg;
-    }
-}
-
 static void riscv_ctr_freeze(CPURISCVState *env, uint64_t freeze_mask,
                              bool virt)
 {
-- 
2.43.0


