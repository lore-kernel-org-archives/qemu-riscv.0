Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8F3CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByNP-0006X9-E7; Wed, 30 Sep 2026 13:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByND-0006D7-Uy
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNC-0000zu-7f
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:43 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHepL21199010
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sAmDnVhA0i46kh20ES8xQX1cBL9fdB8dlxe4KkbGoaE=; b=RsHNSBcEI72GB19A
 WGtiDHs7/toLzvBQ8OZQc5UMJS7KTBhjOReSAMYKzhJumfLuu1hFMg3gzSuFKFSA
 oPLy+1ZzN8lxURzWTw9YcJGd+mpSQq+ty2KaF0Y17GBCfcuocQTfE2G+d3LWt5yO
 ZAStQXcpHy6yZx51fMTHo2QkO3bPWC85xuG3S6Yk4pKY35gfYv978c9Sev8SEqjH
 9k66E3wnnadHgVoq4ZI4ayG/hdGDTl0oQbIyA8wlY8cY6M53KvhqUBqT85YSlI5e
 azQJ5r9UxEkMU9JBTbttgkXnXj8sb9wwmyz6SMsV90Nyp8TCJ0BUaiukguyXBTx0
 /dgg+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136th84g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93a082c014aso7962385a.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790339; x=1791395139; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sAmDnVhA0i46kh20ES8xQX1cBL9fdB8dlxe4KkbGoaE=;
 b=cDa+1385AVIQxi60Alld9iAHLLbeUzXFzbdMPxxsjOgiH3xqhedFC44nuW9yFeR85K
 CbBFbXUFXi9f8dmC77AhlE1Hc3zciDHhspEXDQV/gJSElrvJbV3XdwkiHH2izUWAjamz
 2btKWXcUD7QDe2Do5N2hK6fUCYzYPa2Mlq2zhjXb+6NSXinv2ttO9QXJPuxAbe7CSv/W
 XMAt7nEba0zWmS8lUF+bIEwQWL9OXMIk0fQUb+dO4GLSeW2S+9aZFpoqB/g114t3vUmL
 EhDvM1n+dS2nAe6oi1QlpJtriCmvdPBWuC/6AI+vCWCNy1EqPNqjcWYW3PVcL86KC4Ia
 gsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790339; x=1791395139;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sAmDnVhA0i46kh20ES8xQX1cBL9fdB8dlxe4KkbGoaE=;
 b=ipjSwPeizo6fFF8VKAmCuSP5cs0aJ7fk0Yn4fI9FUxCV7KBkJ18wk7P8naGis8g+sE
 s+wWRl1lqiO6T+nqZziyGc2miCILge/05C4PlCCARW33nAy3DjTw/1OFqv/+MmsuIZuz
 YFz3lNkqOm18Q9QkQPl9qp/nF/1JHVnPe8GzFPmEkniIJCoB5/qMjSy1b5xTxowwnxlF
 1vMAwjtEP1gUQaxUxhNXIXVzafEI2zQF11GfUZrggcjYyWnx/um6SVdqjOEvcsP1Lzrc
 is+5ooNMO0DFk9+TjseljtFSbkzfoEBNSmIS7aH++NkAd5ykwFAhlLbwq9/aCgiVacGz
 kuWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxF8Bogm0OqakEuWTjChKcLG9dfmTP0ADD0ucBLqtEmSMVdT63GZZ9FZimQcST2bpy4aSEM+DxUMl4O@nongnu.org
X-Gm-Message-State: AFuF++kzYFGpI8pXgzIl/EuCuPuMFE0rOZZdYCzC+uWfxIdJt15A93CN
 3FCCxrK0nCx9RzrUJzeF1qQLEWWyi/TDrhM1U4h+ICmuwJSvlaUazFnqzuU4QsUu6qYoZvmQPPh
 BTrC5jFiKwE4aTLYZ7UPUTwj3KCy1ACx9Y5B/2ieL6910sn0ma43nHjgJaw==
X-Gm-Gg: AYBFou1P0B3uPwPNlgX5dJbzS7LvGf0BAuy5Y0FI+MCrDXgQTKzo+XKILN9z+7Juw9E
 r30cmSAlwessbbfzjzLptMwmqultP5alQsuwWV/T77+obtJS/2+CUjFRieQfAqKvJnqZ9meBQog
 LXw1WldfvU7LBRNCVnXXMNiM7IhkjchScIKE0mn0nZ2oYcBxI0DkFbTymdCYbxzGAKnhautm7PV
 eZmsnYLLdyc2vqrgPDc2FHT0SqxGO/jJwk/1y4EnnlJ80sNOGTvr5Actld6iq4pWyDLvBRB9il5
 lRgQJwsBW9t/6nDQxENLFoqc5KM80ohY1SPBuwQ0WZxO7G9pE1w1zpVV9MisMwYsOyEujgeMbJ1
 M4TioixEY2n8V4oiSg5aiHaP694iBkmoTaxT6R5wj
X-Received: by 2002:a05:620a:458f:b0:93a:1196:ce5 with SMTP id
 af79cd13be357-93cb5c2654bmr70351985a.33.1790790339523; 
 Wed, 30 Sep 2026 10:45:39 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93a:1196:ce5 with SMTP id
 af79cd13be357-93cb5c2654bmr70345085a.33.1790790339012; 
 Wed, 30 Sep 2026 10:45:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068bc9b1sm700515f8f.4.2026.09.30.10.45.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 4/7] target/riscv: Have riscv_cpu_set_mode() call
 riscv_cpu_interrupt()
Date: Wed, 30 Sep 2026 19:45:04 +0200
Message-ID: <20260930174508.81497-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX4+BAANfJefs9
 0600dHfYSWALJRD7Ma3wgUKbVA/09jyD7Q5Z9pdrJ3YEq+6LRRylqUpqPqEMzj3k9hAILEC2114
 F7TgBG7aW14HYLvkzX8IOuUiZwaa470=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd4ac4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EurB-bMe9Chw_IDMuCwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _aJNXYL4FuHHhEZHjHMLPj-KSISRNioE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX9DJz7Lr7Mfn3
 TEVXR/WK8WxGRQGAnPOrW6NeQgMgPMb7fnIOA50hXIEGkWBN+zGeYWas4x4AwuvoPQgbW3xxfTd
 xCi/fWl23ZfDsPgiLzgGRjUCqEhpREC61A/hzK/33FtTLgynEOmszvWgKYRtSFPndeO5mauluk2
 eqLFn0sCCkeMuFZN+qzEBwyqieNGJCM3op8OsOKekkNHlMVw7fmbYOn/XOQAfctMDggl4zMxmHo
 9AawsEoSsUKyFLjbMkBSKXfUTgxfZ+433m/Zg99iqVoRUK2rPC+8lSzwguMV/ryWRZqXCcsp5B8
 nWvPtyG5c6IZrEDxiPnW6w36hTaCcp1l5p0NqmoTrHFjGpoM3AKM3PHHCL/mMf2aBezu9sKO/34
 2NKq7uxRgpYEReywXjqEfm2NCnC9k788EY05+ldu+DX+KKTaSnrVs2aXHocK2WaaURzhoyvm+QI
 +U0boeQzaHpJXXVUGAA==
X-Proofpoint-GUID: _aJNXYL4FuHHhEZHjHMLPj-KSISRNioE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

riscv_cpu_set_mode() only want the interrupt re-poll: the mip update
with a zero mask is a no-op. Call riscv_cpu_interrupt() directly.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d92226527..91f5eb72930 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -886,7 +886,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
              *
              * To solve this, we check and inject interrupt after setting V=1.
              */
-            riscv_cpu_update_mip(env, 0, 0);
+            riscv_cpu_interrupt(env);
         }
     }
 }
-- 
2.55.0


