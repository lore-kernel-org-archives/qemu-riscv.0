Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4E5C5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99y-0005eG-L9; Thu, 20 Aug 2026 16:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99w-0005bZ-VN
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99u-00027r-Ml
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7ejx065808
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=; b=PK9hYCGXk8Ma+e+D
 7Uj/LPuExCNCb4yHn0KrSrOvSaCfC2hb4fo9R7tzlk/iH+pL+7sj8hGjBKflbhPs
 Z6+yoaXO/CiOEosHhMfZlNdLFA+nVRFfSRNDLbA1i8kaD9E6R8aGfOFwI3658pbV
 JrNS0RnZ0moncsc2+5LOG43YhSmAwnzg1oAYzI59VlhaRncMT/bErtBKBZko8hiR
 rWM/jMrccNRKRyr/VEaGydCRMWKQW5dZhTKHw1XBD0QPM9ybVrlPXZJWbm8eG8D5
 p7YqkvUgfJ4VGK+7hg1QlQSq2uutwaHlRjFbAf/lCHAdxjPNuilNmoUJBbJHosR2
 yCmCUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0js27-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5276aa86d00so2407181cf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256871; x=1787861671; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=AKfXss8o2dMKTVTAoWtjivqTzQipOu8AI/umnK6b2pcruGyag7TOa20pw1iVyi3h5k
 +Qikdz3UDnuoqkpG5UKN1K2vxQTrucpQ48oQEwVVN7N9j1ZfeaTRf5f4fnfwnoB6aU3X
 9sSmKOTtEMxk5dNQekLT1GiBKEuz/PXKglQXwaVWocL141E7/60p7Xj/gHdzAOHyrNoO
 oERuqvqkBbeYkItfDt5tjRmob4Zp26EPb2H48+StFuBfcRQ9Xn/h2SA61lqPu4lsphkc
 F5s0j3G82Sm6deTnbGkv/xkAlI705URTXIKG1ljPkXDzQny1njR1bcyooKN9SWJpwJ/P
 8W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256871; x=1787861671;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=s7B9Zt4SqHeh88zcebqAqBt740ffyJFKXW5PI/R4oGd1oL31LfmiDV8SAEoj4idYF1
 GS1FzLcDNKEdja/7bjPb0KYjBKNpCr7c/Q8uZh6jgh4Xd/LYnHjckqPAwfxdrOLu95ZN
 gOOMXTVD+my5gt9Vm71u7Dk7mhcZyaCRx219k5kmkr9Wx+8aLRfPVNXGy74x2Tu/28bL
 HnLpObAPjkmr7Z9REfZaUiWBqyNr1uhCHuwOuENhuFhfcCKxt760wO3w8J60JaoypWL6
 onXnudMsdfbgLX3bIcO42CeDtM6EAmn5dBDsPWL+svFrEMw2yDrrze6L3ea8mi/dnKph
 7O3A==
X-Gm-Message-State: AOJu0YyXmNJnAXWGwrPkKOQx4UXuoOPUidTyw700j8A3oYb6VZxRrM6p
 Nd162GmyZjDEhmrR5hAq7UY3xGDYd+aK/ir9Yq4A4rMdmHAFUKfxTINHC6A+DhdJPRZpKpiB45J
 794uRxeMPxGzcaugYBarOe2taT+1og809PO9SoezGYbGYW69XJUGpe2gYrQ==
X-Gm-Gg: AR+sD10BJTM/TOZVuCDAZ9v02b1Wn5TiGB5ACZW71Hw5darTZUSwO+aIZYRvIS2NFug
 QSrXesJputIBwkkWf0ARl4XfWcXB7aowCfhmPXxsiDHxGnUWdrVrZSI+AHfk2NsWCz2CUnvEyIl
 Ll4efB48SOsd/WIqwdixzsSwLjM+6SEYoySulrcRR5ZqykzDtBTCbTBNejrc2fJxd47E1PygQtj
 0KeCzq2vgoNxxrhrLAg/F6eMkjooU8BtEZrReKex8gc1GupGWt3FvS4KGaeNvwZl/Y2OlCVm26R
 1LcI0thQcwCpXHTYe3GQlTRrhggxZ29GSuNq65u5X3YiE75KHTHLvZtBoxXVy22qek5Vao2IYas
 c6IIww+1j8iRAhGmQOnxCvoFpj2RdDetsudI6shrqsQ==
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id
 d75a77b69052e-52df56e5052mr10336891cf.1.1787256871143; 
 Thu, 20 Aug 2026 13:14:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id
 d75a77b69052e-52df56e5052mr10336351cf.1.1787256870664; 
 Thu, 20 Aug 2026 13:14:30 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b8ecef78sm3973845e9.0.2026.08.20.13.14.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v2 04/15] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Thu, 20 Aug 2026 22:13:44 +0200
Message-ID: <20260820201356.29775-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HCtro1FIV2k31Wa_0Wx9V_BE2XvsB0qB
X-Proofpoint-ORIG-GUID: HCtro1FIV2k31Wa_0Wx9V_BE2XvsB0qB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX6P/LQPHGz3ow
 hwJVGVupRFvxZwWxgMHxWfkvLkC3ZUzQACj07omdCc0vGEar85sDuRz0G9K7FpmbX4/FYC0Maxc
 NyWA9QVjN/rDFZjnrWQl37yZc1QYm1XfMrKumFYwXzoafIylmWb4GCIA24KRX9wJZOE0gCLx9XB
 ha2TJ6pJRITDDQ6VN5YBPGWr6Zx0onEY8XNy/b6GGz1Dk4OhxgmjG84ZzZoSxselW8gsTjmGoVr
 rVhuwJCdKtzplzKRWOQHlDKfBJaRTZefrxrVxKPqjypfEh8vUk46vWS4iwIRLOvUr0WJl/0F042
 +D3o0h7svh6puSX+k9mrLFIMOzAEqL6CN7IAfG1OLyrX5OPCb8PuG4XjtpXKLS2VVDv06ma2cJV
 0dih64yX15go6mK2tLf0gb3TL4toTnpVeZufhAbK0WmjntHMh/OnnBOGwUj74vDwhTA5ge5UwlB
 Z/trbkX+kqOWBKLuNJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX3z7nrrsijD9J
 8p/jqeQPVOnq6Y6a/5siK4jumtnhrhNGN5au6g7j/Z2a/33g50sVNpWjMpjmwfq63TCFabYUIx1
 igmGWKR9MXz2uwS+DB8uM2eaqFwHgVc=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a876027 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=8cuzm4DnCyvNWT4wVyEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

@env argument is accessed without modification in
hexagon_thread_is_enabled(), qualify it as const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/cpu.h | 2 +-
 target/hexagon/cpu.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index c50fbb3f72a..e4f120eda17 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
  * @return true if the @a thread_env hardware thread is
  * not stopped.
  */
-bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
+bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
 uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
 void hexagon_cpu_soft_reset(CPUHexagonState *env);
 #endif
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9765716b516..4cc6bd67c28 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-bool hexagon_thread_is_enabled(CPUHexagonState *env)
+bool hexagon_thread_is_enabled(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    const HexagonCPU *cpu = env_archcpu(env);
     uint32_t modectl;
     uint32_t thread_enabled_mask;
     bool E_bit;
-- 
2.53.0


