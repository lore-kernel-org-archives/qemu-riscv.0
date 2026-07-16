Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421EC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLK1-0002na-Vb; Thu, 16 Jul 2026 08:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLK0-0002nE-9V
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJy-00077O-Ll
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:12 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiN722678270
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ABclx9VxU6T
 JYU/oQ5YMaR1V0j1Xrqljshb3DW4UPkg=; b=RFztDQGDQX3epZZvl81Ys3hhclq
 lc5ANnVzd+rfsLcVPoxlR6ePCeLziUnsv1k+YIEqSanYjPKJLKtkGHW2FHq+nW/i
 Zc4lt/hwIYGkIqw5H/dYYBwr/UtVrXiANNGoqRpraZywh6WMKN2wAc2keBKjfBN3
 44UJsuUb4fFF9R/CwASzLooOnbSx4UDonhaA+OH2eSLIY2gQitIMKcyR4+v0ZPO4
 AEGCrO6b5eH6Jz79sILQUnFn4C3Pfis0yE6HeQNPP2w2/vZMQMevYoSoWIBAqqBe
 yZpLxr4I2GELVojagC3hbfOWQNT9lerrNznel+HGzK4ZKEstSdt0+8mrkdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rvfc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8f1e4e0eac1so86518026d6.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205369; x=1784810169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ABclx9VxU6TJYU/oQ5YMaR1V0j1Xrqljshb3DW4UPkg=;
 b=MthyCd07Zsq7/+HoWP2GHmJmDcWdu6rFtS9DJwunOnguIQx7/2fg/FmCGtYKgG96nu
 hIIdcJ1Bbpq1mPXGSscDzdEeSAlm5dlYKUIAk/H1pOuQFwjRtOJ2l/OG0eraSezh8Sq+
 JxUHv4/cWgNSuj/ctb/t/njr5peBgdCsX/9cQLSNxHJ3Hfa5wttFSg7CN05x7Nh49IrO
 YVs7ydB+nngUXOV0RCB+GgRkjKWsx/3IpzqLLKZd7Bndjs7XrHZQ6tRdx4K8TFOztEH4
 ryf2QBTzQzWHJz/sp/+oMt6Li6xe5xj471wfnNky4ggdgUY3q95krrwMh8ugoBoeYwrI
 1n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205369; x=1784810169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ABclx9VxU6TJYU/oQ5YMaR1V0j1Xrqljshb3DW4UPkg=;
 b=lRcFVj0Ef+0AWeFcVuPhewLDfUaDQ5dmQrH03vi8S0SExkepWFBXIZ+2W1mBdS2ooW
 9jDs73LSkYhWZjIMxw4S7Vd/YTddhJbRu9ogMQISOzSqPW6WcEVdUm8PS4sG5/iaeWBH
 n5zPSNzKB47xaNU8VhRAJSG4zEA0ZbdqcIH7KxBiz3l2S0Ahg3JKYztBszpo/95G+pbp
 MZuYxMtCcgLoRHa+kvKOlJfFs7vxlF1vSUlpgXvyIlRpT1QW9OxPIPIWRf+q+6u6I5md
 CbPbIZqekAfHoWeSDFFVhLvVBkUp62OpAfcyYrXp6lju6RE+Gs2kQjMmnimCHXZW9zl8
 qbiQ==
X-Gm-Message-State: AOJu0YzVJU0fLKJBfC34l5WebInUfJKBRzTxqu1URJT3eZm3N0WoS4MU
 IZT+Hv7K6FKRTd5fZM3QyNcGgDxrNyCe7KiVA2QIggxGPNGSQmf1364+45RMLMkS+mKqTwZWdMA
 wPqlr9yX0PriY1VmxOAe89JMZs0kuYBD2zr8x0lwSb4fdVc871kermQz8FA==
X-Gm-Gg: AfdE7ckeVrKsPZYlhCh/I66VdZqyPhZqDGI9ixgzUEXFya3vRTSUjv8MJMCh6msLh+9
 YsKAcRaaQj1qCIj9Ol6kDdJrv5RxF56ULxoBGp4sKYV+0sTlrqf1onHxYYFPAA86JMCdrkusDw0
 /m3L18Ouyjr21MB8BSD3XNhIVKTvpSQgV018u0VPFClpgu0d+QjQhtvxzqtkAtEoNbtLnDIfGCb
 VtecSg1NH6WHb9lPWFgSW0YxYfHmYiRmfRJ4miuRlm+O3FgiIqQkPTgtse7EnbGIZpNIKji3g+x
 rnOsNmZsWyOv+lHiVDDe3MgTiN7xw2cK6hj33VvLrlTK05yHN3az8Sebb+W3ZX3LadYrST0Ti2+
 Kd9PrChzCV+OBPBvPi41kqwX9JQev5+bKkk8=
X-Received: by 2002:a05:6214:5785:b0:8ef:a9ed:5e9b with SMTP id
 6a1803df08f44-9074c8928f3mr116274086d6.55.1784205368902; 
 Thu, 16 Jul 2026 05:36:08 -0700 (PDT)
X-Received: by 2002:a05:6214:5785:b0:8ef:a9ed:5e9b with SMTP id
 6a1803df08f44-9074c8928f3mr116273566d6.55.1784205368409; 
 Thu, 16 Jul 2026 05:36:08 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:07 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 10/17] target/riscv/debug: Fix breakpoint matching
 action
Date: Thu, 16 Jul 2026 09:35:27 -0300
Message-ID: <20260716123535.3709148-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX27DQrFdADlic
 rjSOLE6tZ3rhs8C+m9kd5Q0c6272jvL6QG4DQTUipyKRg6SXiKiXExcWhYF95ZBZ4VjWD8ZchCY
 dyKQg5vd3rDCjGoDJPrQvGxgHKu6Is4YN5kU4OsWSfXZRtdrHNtlj4ge5wEft9EqLSfbSuq+nYQ
 wDBrtzdHQunLtwIt2vxSobs9d3+fXzZQgIzV3v/oZZEp01H3XVmxAm2t2qptDSXhuDGTgRXzJX4
 5Y6Wf56ahRK41K0lQL7vW7tljwBE6cW4PNuAW6GMVYh13RHSbrLzWS1W8iVMqRy7la5IUVWYr4h
 ARycNUtiAE86D3q7Yi6NSVnqZdBc7xg5ISs5B8eb8f5oPzHCcpTXYbiDzde11/d9RJM5uzv/qRL
 AUyMrzGKz/5GGkFbRccHn5KQcea6NXE/uPrWIPwus0adahyMAAjh/oRRvCpWEJVBuRKuG08gPB0
 OL07d5o3vISS8cJrqlA==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58d039 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=yV3_rp2NExHQcldBhgkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 4FiLqiQncVhT2GXu4Cy9UWKTp7YWoh0J
X-Proofpoint-ORIG-GUID: 4FiLqiQncVhT2GXu4Cy9UWKTp7YWoh0J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1+ewT1bCruHt
 6sLeVWONhldoCRHQSCOh3bGNNimqfWJidkadEl9dGF1DKN4LXgDTXRL45v0Rv16r+mdkr3Sl1iN
 lKyShB7UClJ3OtQlxubQ+RUb3UVYAhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160129
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

From: Nicholas Piggin <npiggin@gmail.com>

The debug exception callback is too late to find the action for the
trigger(s) which caused it, and it is actually passing the wrong thing
to do_trigger_action(), which expects a trigger index but is given
DBG_ACTION_BP (which will be interpreted as trigger 0 and use the
action set for that trigger).

It could be possible to derive the trigger index from the bp/wp address,
but that is clunky and it is really the action that determines whether
an exception should be raised, also multiple triggers may perform their
actions in the same cycle, so it is more consistent to check action
during the breakpoint matching phase. If a breakpoint exception is to be
taken then that is signaled at that time.

Fixes: d1c111411e ("target/riscv: debug: Create common trigger actions function")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index d98e737763..f671ae67f8 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -282,7 +282,8 @@ static target_ulong textra_validate(CPURISCVState *env, target_ulong tdata3)
     return textra;
 }
 
-static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
+/* Return true if an exception should be raised */
+static bool do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
 {
     trigger_action_t action = get_trigger_action(env, trigger_index);
 
@@ -290,8 +291,7 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
     case DBG_ACTION_NONE:
         break;
     case DBG_ACTION_BP:
-        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
-        break;
+        return true;
     case DBG_ACTION_DBG_MODE:
     case DBG_ACTION_TRACE0:
     case DBG_ACTION_TRACE1:
@@ -304,6 +304,7 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
     default:
         g_assert_not_reached();
     }
+    return false;
 }
 
 /*
@@ -720,7 +721,9 @@ void helper_itrigger_match(CPURISCVState *env)
         }
         itrigger_set_count(env, i, count--);
         if (!count) {
-            do_trigger_action(env, i);
+            if (do_trigger_action(env, i)) {
+                riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+            }
         } else {
             enabled = true;
         }
@@ -967,11 +970,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
-            do_trigger_action(env, DBG_ACTION_BP);
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
         }
     } else {
         if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            do_trigger_action(env, DBG_ACTION_BP);
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
         }
     }
 }
@@ -1008,8 +1011,10 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                 pc = env->tdata2[i];
 
                 if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
+                    if (do_trigger_action(env, i)) {
+                        env->badaddr = pc;
+                        return true;
+                    }
                 }
                 break;
             case TRIGGER_TYPE_AD_MATCH6:
@@ -1017,8 +1022,10 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                 pc = env->tdata2[i];
 
                 if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
+                    if (do_trigger_action(env, i)) {
+                        env->badaddr = pc;
+                        return true;
+                    }
                 }
                 break;
             default:
@@ -1069,7 +1076,9 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
             }
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
+                if (do_trigger_action(env, i)) {
+                    return true;
+                }
             }
             break;
         case TRIGGER_TYPE_AD_MATCH6:
@@ -1085,7 +1094,9 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
             }
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
+                if (do_trigger_action(env, i)) {
+                    return true;
+                }
             }
             break;
         default:
-- 
2.43.0


