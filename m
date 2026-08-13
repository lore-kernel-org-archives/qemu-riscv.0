Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CADC5DF69
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuZze-0002Cf-B9; Thu, 13 Aug 2026 14:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZza-00029F-G8
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzZ-00026v-4N
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:26 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGDvox2916956
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KExF4MwbTUUQ/1tzwHuPXSMnN5BfvbjHcIrr3pOpFSs=; b=pnUQhFoVW11HG5T/
 +qFN91c4WEKaLfjB5+LNkNFCF6vStDtgEgoh0EU3j8U0k0yi/4Z4IvkaYUhYCGXW
 ctvpTjdYAFCIO7uL++oSHHC3Ms2k+iB+SVUXxpHjfwaiTk/YGQHl+O+n7/RgBdjJ
 iGuFiqRlwn3tn6OQ4GT2IFHt82wMNMM53ScXjA0pWA+5pZ3I4z3ou+UMCvYEDw8w
 HW0Z10PC4LMkzTrHQbs81l3Fj3/M4KW5TjPMmlmH7chIn56rASSlLo3E42fzyVng
 TW5Q9f59L59gb/2tD5s8enCOZ7eJfR7bqAQhoTt9s3FSGw5JLPd/TyJDR8DlSYxU
 dS/GNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90rj4h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d8243f1bcso3713541cf.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645033; x=1787249833; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KExF4MwbTUUQ/1tzwHuPXSMnN5BfvbjHcIrr3pOpFSs=;
 b=IQLRxpLNX8MXAgTmVPcUNmuxrJ3jM8mJc7Gdc5sLtPT3z8r2uxh3YsZKE/bU35UwtU
 /JmAQY+deFtRaQrnEY0hMqZmOHIDeLc0gbXQkjf39VmxJBVgUCGit9cbc5yGGd6my8Zf
 ylsWQ6a8DiXzrvkr6kHRoT5QmKbW4IZRr6jBTmzftqxz5r+X+PmVJwWwjjIJDu7GU2xl
 s5jZRyF3Q4wCHQgMFOq+l8sfUQ/HovYIVdbB6FiThuDL8F3ipLDDLyA7g2lc9UV3FNDI
 cg7HA7lnpjPehPnx1bdCTf2/pfPjE9rofDF9bGNaPoJwYheMJO/IDZG07842SAixlc/Z
 ZBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645033; x=1787249833;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KExF4MwbTUUQ/1tzwHuPXSMnN5BfvbjHcIrr3pOpFSs=;
 b=IkZvjYDf5tpvMoUTuOiytnO/4UqFI8Eob0xNw6uEC48jmy5vg7HxgTUBG5jxu4vnEd
 ftI078aYmmh/7kiKGgtg437kaZ1fx3mqq4xwg4Y1hnyK5v2riINpWK/vK6DQjaHDTrCw
 2eu5J3thGBMCGdS3Un28WWpR02m8nVZX0ZRHLV+Cox/fe/XFNdJ0Brls2135IynKoMSR
 8AI9OHDyWklOq+PlVNNXafkljFeyuYHNvEe0mFYrEHrd+Tm57nJ4EJvV+fGdx7tPMCu5
 WMKFxXrJaO2b65j0QsATHFc0eLwSwV32BHrmaMtXCWr1CKEkXaitUX0olrwGMme9Wyla
 wwzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpLzud74+wKdfU9LlXAeIwWM+0XS08KR+XXjmwwL8Bd4dHZnArtxlVNRdx//tq9vrPKr5DWlnyUHx4C@nongnu.org
X-Gm-Message-State: AOJu0YwVsAewERIaNizyZr/hexGYMyrRkhCv0pLnNk+n3fLrVrYXl1O1
 ga6+lBSr1W3LPi8JJvJhoSOmcXgjPW+4JoqJYedVCiAIxHth25RBBymkGxUa0roydSjRHU4pSzp
 f/ImoU+E7jpnvFb0zRDAEWrdUfz8o/ev+XppnAIoy9gsb7Ho+G4HK2yad9g==
X-Gm-Gg: AR+sD126PDW49W5OAo3jGoUR7ThyxBuTxuzS3/yELZXQ3jyFPK9fGHKva53Aw+nip2K
 kk66BnwPMuh1JgR2NUc6oGCAG3SCt2a/LW8EIWgYOIt2WdvGdng1v/OyHGPt90/uxq1b2erdyf5
 tCYeybv7J3Y3GiC00OChxrEE5KfI6XTkwgeKfiX1v0CEI/YkSU5pZ4ie1bcGvd4dDjWhMbP7EwM
 5bEgpVjxPXQFfC2YpHtHiRKJkrSWyi0yQapsetyIYBjX1PoqSEu6sz2OCvkyOjVq4Ah//C3VIEU
 dCe/7QbI3aFQIsDWkjJnhvmJgIw0YpgNAVh+f0aZ9KUEq0XKI7YCgKUgtRoyT1EOJjGN5bpYp+k
 PWaEWCFke1Pa0NW4MMNkHyT4sbrmVKj0GM1KdUw9JgA==
X-Received: by 2002:a05:622a:1a81:b0:516:35fe:5524 with SMTP id
 d75a77b69052e-52d74a3546cmr70162371cf.5.1786645033493; 
 Thu, 13 Aug 2026 11:17:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:516:35fe:5524 with SMTP id
 d75a77b69052e-52d74a3546cmr70161411cf.5.1786645032819; 
 Thu, 13 Aug 2026 11:17:12 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499877d20fdsm5607615e9.1.2026.08.13.11.17.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 04/16] cpus: Rename qemu_cpu_stop() to
 qemu_cpu_ack_stop_request()
Date: Thu, 13 Aug 2026 20:16:27 +0200
Message-ID: <20260813181640.6537-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7e0a2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oALTtu6IgWlc6orpIWcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXzLF+404YSYOL
 vO5kNoK+rf2l+G2uQsb12cGTsABtuPiientU5ULgXUGzRrWkJdQUY+uBQXwo2BnHotV5B/j5wHQ
 XuYdoJo5NNOg2slSfHFdAS2d8In9eio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXyyUYpQCvpy0C
 DfnheabeM9g24iAicvsYYn8+w79H9mhTXkmVWV/ySKxi3rg1WKAjyeWybFoXAxnJECfEDWy5knP
 M4EnSOzwuh4CDX0fY3lO4+w+vIUimOfqkphXucG6YYgln98magt4/YpYlnd06Svx617SyislZoY
 27sgMqLD/KFGO+5wK5J96OVx8Dwi4u7rf8A0Na1QmnnofmJ+6IOy+GXjHNp1KR3GOmByitM+i1m
 dq91vJKY4Ohlzsb/mSQOFbRh1CQweuKjumrD/TnylZwMLCdlsejs29oZIwk10X9oOh4kxxF6tp7
 eHT4WdoFdc43EvFLjT2k6c/E5eYq7NSgzWxqwYoIfuHm6cHuNFAOu6LmSHLkhK7hF+1MiJi7fY4
 YRKMd4RVnozs3UrXeBUIrHiB7WQQX5Z7MsblfQe+8WCtB+Pa23YtFvZgijKwu+M93w5lksWvzaL
 xFt5GklSM2sCWh6q69w==
X-Proofpoint-ORIG-GUID: LJpIfQY6TMHgWyDJWDMh0kBwtQR8io-g
X-Proofpoint-GUID: LJpIfQY6TMHgWyDJWDMh0kBwtQR8io-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Stopping a vCPU is not a simple state transition: an asynchronous
request (CPUState::stop flag) is acknowledged (CPUState::stopped
flag). Use a better name to clarify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 system/cpus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/system/cpus.c b/system/cpus.c
index 1a6fd286a81..f69558c760c 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -382,7 +382,8 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
     do_run_on_cpu(cpu, func, data, &bql);
 }
 
-static void qemu_cpu_stop(CPUState *cpu, bool exit)
+/* Must be called by the owning thread */
+static void qemu_cpu_ack_stop_request(CPUState *cpu, bool exit)
 {
     g_assert(qemu_cpu_is_self(cpu));
     cpu->stop = false;
@@ -397,7 +398,7 @@ void qemu_process_cpu_events_common(CPUState *cpu)
 {
     qatomic_set_mb(&cpu->thread_kicked, false);
     if (cpu->stop) {
-        qemu_cpu_stop(cpu, false);
+        qemu_cpu_ack_stop_request(cpu, false);
     }
     process_queued_cpu_work(cpu);
 }
@@ -555,7 +556,7 @@ void cpu_thread_signal_destroyed(CPUState *cpu)
 void cpu_pause(CPUState *cpu)
 {
     if (qemu_cpu_is_self(cpu)) {
-        qemu_cpu_stop(cpu, true);
+        qemu_cpu_ack_stop_request(cpu, true);
     } else {
         cpu->stop = true;
         cpu_exit(cpu);
-- 
2.53.0


