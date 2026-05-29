Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07884CD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT26o-0008Go-6J; Fri, 29 May 2026 14:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26E-0007wh-R0
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:38:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26A-0001cF-Ur
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:38:25 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2HX5198960
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=; b=PLq+NDF8T/m4cGIC
 hannQkkSQDlnNJfi+xc2N0Mvl7l0RN0lrF4v9/UL5h40v/+EgmbIbsY3Jf3DuX9r
 4/pfck0UdAtbqE/KVyOd9XgDaxE9suRivtiU5xespvIBnbYDbDz8ccfw2pRgGyc2
 pIGkWGqpTz9AVCPGb97l+PYiU1G7r5pjJuEEHhn0862ZZ6gKOdbZOEtfP06cjtlG
 Eku4VpzGsa2spLDWWerpoHeINpreDLqH4L+gfvTT5PE8G0Cejr32LvIDoPPMGZoz
 AQgjQCoLc3a1L1IM2IPI77ExhrRX95wdtta0ZQ0FGBBAe/TsxVh6Z5CRrDQ/TJnn
 ndb9wQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efdjnh6r0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:38:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304d8613efbso2632429eec.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079888; x=1780684688; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=;
 b=MkEKW0WtKV9oxXmFom09UDduNVF1c5lVIEEnwItLyn3vj71+wIfCMI7Z6YFDKmgD8O
 vplvdKt/axDiKdE0npBVZ5kA7DEYmUHuzCF5KCZMHIhULipWiSAR8kIuHRaL+5MZidVb
 kU3KRYeT4JsY0wCYEd9p3HJKp1lop7BOFI0VPTLOhPMbx1PiVpgYDfUUgvgLMjZEkWQG
 YMA7SwLzMycDvmYIn15WzE7DhYq0TAUu2hnr9LGQOopz04sZEPEXmSDt+xRW7fFE2ibu
 U03lUWDnXWUH7Puivn+1kzPWF1HkNyRd52Rd79yB1sRoInN7PCWQt8Pwx3jVXJ7MhZnr
 i2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079888; x=1780684688;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qu6dr6kFW3wuBHlsRpljUoTZoNPGCNwbOjajcP/koUI=;
 b=ZUwwPLIGRvUOHApzljN50Lqh6OlQdQtz2742k2zqpg2hUhbXJ3HWbRIcd+Dc1gTjFv
 lgXsKLs2OT7RTEEQFgVinPP61F4vOgJCrRZRXMwp8QeUQzrvaV8RMepK9dPzFY4+uQEC
 lqqS8MlrwUp/LXY6bl3NNdH0pK28+oH/NQReN3rpgNBcNCdjuSUuuonTDSCnS4/BsatK
 1oDp0K5m0zMfXEC3xswhsPwWQ2YbOpKeANPJH9gT6iMR2j4810NeAPMoirGTfSqZBA2h
 wOFVJniJauz/DKbh2w6qnn93z0CRyv27hpu1uIqDYMqdp98ppF473diEGzbRqBU2fgEp
 dTRg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DbgO0uRpoLtuhsZKSDzTlJiA8EtO04EE9ibh701MKHAXOek1IB2qQTBmHpGjWWc20eqzYviET/1i6@nongnu.org
X-Gm-Message-State: AOJu0YzVaJo5DLoCjM4Lw5gvhRYiLO/GzPDfdLuxgxNxjhiZ1PuVphVM
 knATVIZaFAGLH7Cy0UBE91W8ZwBvcQHfBQfb02If/ho1wFlGmwqIuufNTS0Pi+1o6H9L3msr0pz
 02lFH8vfIeU5YA2ywXXt+APWXBBSZpm9rr4bXLJSzn7OASnE/jBij+51xyQ==
X-Gm-Gg: Acq92OF24kzK+e2Dgv5k5Ql9miUM7NiGgoVAIq4q7SBDO+Rl8cbC4dZOQfb30SeNz0G
 mMA7S7fn/JdGEoZobL9qARUeRteJYTm4j6ZXuyCOGFKt5mObmfnpG2BEkvg5gwpBppmSjRNw5dS
 UyV16R8UhJnQ3Yt1jkO+cS0aTwDi34G/bg++I5zEbf2FiR6FBcvOThmbGDu2uGK0GRGd4nj1nza
 XNcnmeROUiHOV3wWWfgRONCQhuosYCCswJYEU9PJ8W7wVFu3jY99foF0Z+RA6/F3sjGYxnZKOYK
 P9POJ/y6w40uJuNKIHU9XvkYkjKNUqx/Txol1ONmCMJldHqP3rKuqXCwW5kM18GZDdoFnVFEcM8
 Cnd5LsWRv0E0JynFoFdHZAGqXcdG/n83vJIyygsnRDrfP0v4/6Aa7QTQ8xFvXtr2s+lpU4swOEF
 8Bro8b5EDpv4V2yDyz8nCW/bkX
X-Received: by 2002:a05:7301:100a:b0:304:dbcc:5809 with SMTP id
 5a478bee46e88-304fa6e71b3mr502266eec.31.1780079887509; 
 Fri, 29 May 2026 11:38:07 -0700 (PDT)
X-Received: by 2002:a05:7301:100a:b0:304:dbcc:5809 with SMTP id
 5a478bee46e88-304fa6e71b3mr502228eec.31.1780079887020; 
 Fri, 29 May 2026 11:38:07 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed578c48sm1982340eec.20.2026.05.29.11.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:38:06 -0700 (PDT)
Message-ID: <0b095216-411d-4bb2-8b76-2dd8169cf330@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:38:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] accel/tcg: Convert AccelCPUClass -> new
 TCGCPUOps::cpu_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-14-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1NVzEFRZLdrS
 ADupX6OYMyY4WQC+eU0Z/Tri7InR1hHzaXX/8aVguzvJMD4N+8Ze1pdgJ4XtooW6bDFQ8YZEuRi
 39pI/7mzmVu5t2Z0MfVmUtnomt8mbGt3xMPp7uPimlU8JQ9yYg3DG9yRdOn0Tnz/gL3Iq21xKHO
 mUiNOTJWGAQywl6LF8SzdV5kBpaEXYIAUVsKicnbgPSE6hmBdGXL121SL93JAWnpM/1X5RsNXvX
 8DXCRMU8RS84X+boLTY7gp+mOtSePvATntttuUakYzb8jwKlu6JZUduxfZkPRKxO+ZkLbS0Up4T
 Gcs0H4354j70/8UoLETtSXKYYU7xvHRBJngwJ9AGzdlP6Vstbj6QonokBfYcLgjxxOTCvL6o98P
 pDq2D8hhcmSzur5WGxG1ahZwG4dJeSJ4IGGt+3zqt1m+dB0dOAhUwUq0CSfAj4aZ4MJ7+CdYjTa
 oTendCs9Avh0Aht5k0Q==
X-Proofpoint-GUID: VzTXN7hCSNNuLBqOUWGvA-oq-RcYe6cx
X-Proofpoint-ORIG-GUID: VzTXN7hCSNNuLBqOUWGvA-oq-RcYe6cx
X-Authority-Analysis: v=2.4 cv=PtKjqQM3 c=1 sm=1 tr=0 ts=6a19dd10 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RhbWdbH4l8ml5Vp1eOsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Introduce a TCGCPUOps::cpu_realize hook and call it at
> the end of tcg_exec_realizefn().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/tcg/cpu-ops.h | 1 +
>  accel/tcg/cpu-exec.c        | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

