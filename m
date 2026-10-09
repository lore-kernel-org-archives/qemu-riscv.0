Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52076CA6015
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 14:12:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFBKi-0004CE-Od; Fri, 09 Oct 2026 10:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1xFBGm-0003Sn-B8
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 10:08:27 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1xFBGk-0007ye-G2
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 10:08:19 -0400
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5bcb0f245e0so3404863e87.3
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791554893; x=1792159693; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wMt3f/k4K2cy70R7p3thxHF9lPBBoNSFVYlGu6oukQc=;
 b=smtkmgmpBx9vOhngeWDA7mw6F/P9VSuM41cAUqQpIzvXTma3XSVKyvCQK7LQU+Qf0w
 SRgpiDFQtkySa3VCCyaKqAYTawV7FuX0TXpwuF0TFl4wLSWfO3azYuaRb2shnrHefHnZ
 WMH2QiUU68MBqZ+BReCrA7fxMtOuqzuMkSUUay4U1BomD5mCCs2MBw/gTJZmeudU2Phj
 xQSFFzMjSHJnCJs6NQCSGCFvpy+WOFM6rW08wy2V4K2amH8CsQeJVNMCA015NQioE1Ct
 3Oo9+CcEGYbRhBjdp8t7aqbsPXxB8AO0SwQMl5bAxzxQrhRtKJeebKFljAsxquJ6xsQA
 EYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791554893; x=1792159693;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wMt3f/k4K2cy70R7p3thxHF9lPBBoNSFVYlGu6oukQc=;
 b=Legsop4A5iyyJD73W6Q/wcgAzLrFotMy/6JFzycyoi+OtpdFbyHxxKG/wGQSYiOYr3
 hSJDfJrat+Lp0LxNIiHIPb688jeR9vRMr3aYeq1oixLhR8uhC0siBuz9n2AYnK7+udfi
 WuGJrlesTTYv78tWTKHpLSUswlVaf7EkAg3azi++sn4AspU2UTOuaHebDWsBjxe9Gifp
 j3WYPeiAfX8+7wP7bZsW1YNxk6U/+n4SS+isUI6QOU6iaYen+Z29u65gIiE0ev539pLe
 p+qvPox0i4bsBepFlt4O0VpKwudDk5qy8xryBGmG4gQUny9TF9gFLOg05wKqzpIx6P0d
 gjvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBztnZsOphanAl0NcRWN89ecYkzKJBkzziYgq4gOf4K9UgmkDfL1yFvyxGh4OctbkZT61yzuTvFdXHFO@nongnu.org
X-Gm-Message-State: AFq9FYLLmMEIN05y0jAFx25njaXvNCYtMM9WaxkXCUdCBHRFNjNmH2s1
 CruwOGGzNNdfVmQQYrwCSh26qSLlTs1DFkpPY28Poa4SrsmBeZfHN16z
X-Gm-Gg: AYBFou2LkrFrKma1C51QMRW+a+tvND+vl5gXE2TzjHixZ1Kx5ZJQH8dI9OcNw+kvEp8
 cowrhFQV9dvdS1dl90P1Xs7F/F17wuvFxfSrhbOjKZ2fgxeqmEmHCn7vqdt0QRz5O6g3seH1bzl
 Ryt4bmw/36q2kuiic7KiN65ZeZhJlhCRLtpEHSr4PBnxspFYTZ3HD0AOt1vYOvnaurCYemRxYfH
 pKBmwXYK+ohxJbt+SvDHf/MQHXpUP/ikepTWDODVltm2x0KbnktauKleE2ounyoUKO+IolvG9No
 wuKMDFm389D+Z/50316Z6YGsL9+sH8zTXbKVTGEvPsOWiX+FDkKDTxyme4+S14+SwtH4XFch10x
 ocUc0f/zp1AEtKwYb0n5F5DeiTuTiLD++Dl+CiQaINpPzFtBA8Jim+q5bxcHjePonNe9Oq/uOWS
 YA7JqKrOeh1cMLYWZfa1cD83dFOM2ZKg4L6xm3ct6LPUfJCBsMETcMVtrdPh5KBuqgDW2+Xycsj
 tW8i8hbBWWyvS5RJXhdps8hWO+pKSdDkL/sTw==
X-Received: by 2002:a05:6512:138d:b0:5b9:8480:88c7 with SMTP id
 2adb3069b0e04-5bcde6c26famr809518e87.27.1791554892891; 
 Fri, 09 Oct 2026 07:08:12 -0700 (PDT)
Received: from localhost (broadband-5-228-114-10.ip.moscow.rt.ru.
 [5.228.114.10]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bcddeb627fsm663755e87.68.2026.10.09.07.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 07:08:12 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Fri, 09 Oct 2026 17:03:03 +0300
Subject: [PATCH 2/6] hw/riscv/trace-encoder.c: encapsulate icnt counting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-upstream-ntrace_filter-v1-2-8f061c9b24da@gmail.com>
References: <20261009-upstream-ntrace_filter-v1-0-8f061c9b24da@gmail.com>
In-Reply-To: <20261009-upstream-ntrace_filter-v1-0-8f061c9b24da@gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Alexei Filippov <halip0503@gmail.com>, 
 Grigoriy Bereznyakov <gregoriy93.gb@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=BPxFIzeIxLIrqlEuJ4+89kKoS4OSW4gwNkRUZNfp5tw=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqyPQWaTvRAOA20eXSoDT6GzOyqrH+dFKhyaVlh
 +uXe84eryKJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCasj0FgAKCRBIiqVupVDe
 dmtmEACuXRh1saQfw4SKudpB+IxXvL32pRliTUqKISOZWALTciogmvp2+x+MypTmC42z2+eJC/D
 gvgkJG+MtgdCvXXgu/HyOimN/jul1+SuYHiPRgO1hG3yraffuc6x+9NPBOKzl2G0r70NXfjrqZE
 zr0XftuXRhz2aQxKIeJp0J2BXgSmUPDH3VnVRFUaWw0GW+dVVsY3nxU18YrD/QhPw0WHEPJwY1t
 M6G9Y3iNO7Yz9edw9Ilcj4jH0imE9iArZ1E3T3QNhhkSuGZc91WCiWhj8rYyVXQ2qbim6fkz8Is
 GDYafB64nwrwe934syBgb8kd0FQIkS3eQm3IVuxkUMgewP2ewHG0hU/jhC4KCkfqPJ1hwXKdlsj
 z8VkMRS8Sdy5szzIFe/8a4n3W18maqbEUilHH751GksYVNz1XSZNlMthnfL3MltcEY/OpjNRApE
 2Dhy+R6wo6bw7Byz99puios0XrOmAexJDWyAFarIPUgvO4ahuFwK+7pFzjAgvG9aqUDYYaf6jB+
 q+2hmCegO0gCoNMz6oU/zWdPtQOLmwq/Qf2HVOtHKfEtTFdFffCCoGMIkQiyAWRmTdyXqFc6r6e
 4QQ2kLGiAyp0+4Yve5JfirK7Z7DIt6PQ8IpVHS0f2PZnOsCOQRd7/RTO47qRRmO0RxO69Do4sGb
 94NgOEVLTjXbR7A==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=209.85.167.49; envelope-from=antikostya2@gmail.com;
 helo=mail-lf1-f49.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Lets hide icnt inside message emitting function, to handle it easier

Signed-off-by: Alexei Filippov <halip0503@gmail.com>
---
 hw/riscv/trace-encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 11b07b0f3d..50d971336b 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -373,8 +373,6 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
              * using te->trace_next_insn
              */
             trencoder_send_prog_trace_sync(OBJECT(te), env->pc);
-            te->last_icnt_reset = env->pc;
-            te->icnt_accumulated = 0;
         } else {
             te->trace_next_insn = true;
         }
@@ -811,6 +809,9 @@ void trencoder_send_prog_trace_sync(Object *trencoder_obj, uint64_t pc)
 
     trencoder_send_message_smem(trencoder, msg, msg_size);
 
+    trencoder->last_icnt_reset = pc;
+    trencoder->icnt_accumulated = 0;
+
     if (ARRAY_FIELD_EX32(trencoder->regs, TR_TE_CONTROL, CONTEXT)) {
         trencoder_send_ownership_msg(trencoder, FORMAT_SYNC_HCONTEXT,
                                      trencoder->cpu->env.priv);

-- 
2.43.0


