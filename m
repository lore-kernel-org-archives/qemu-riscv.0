Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABDCC98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 17:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93y9-0007hl-5N; Tue, 22 Sep 2026 13:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93y7-0007hZ-MQ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 13:07:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93y5-0004GN-Na
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 13:07:47 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjdbX898318
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 17:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yodo8FKkLRDwokUgHAxXrm1Z7rgg6LvvkpERUUT2ukQ=; b=oHTtLTC+XBIgZsZa
 hkFoDJsPkln/vP/E32ceTtvyIEyxlgfu/8YclSrtagWb6D3FZyKR1xDpwj5QK/3g
 vy2k5q7+7fu7iUv4FYqw27wlErAE8Y+6GG5OeFPxO7gKkHupyc2A+rDKsYpO2VUD
 Os1mcQe51r98K05fhAU9wlmvDWZx7KlqDXC/u9qwvzXknO7pTG2gRGFptSfCOJvT
 eFLgEfCUpUtcaYoNyH34Ms4JDIddR898Gz+Ed/jDgl3O2UPzjdpR7QmEkcWAVjJb
 0CSfPicwmI+Y74GvGuH5Uzy+Ff+hvwWcbyoWlLH4VY50IyC2MXdsMZzUWidyu6xc
 eo7eXg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkyh4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 17:07:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97e8d95121cso85187241.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790096863; x=1790701663; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Yodo8FKkLRDwokUgHAxXrm1Z7rgg6LvvkpERUUT2ukQ=;
 b=BmN5/FmSyNuEl0KkrrF0T3LvDm+Lvf5ODeTdm5DgeZ0OO0EpT3VPTBZQAL+wCAV4NP
 a4X7ux3639k9a4EnDr6n9VMpS78f08iAucS+vL3A1f1XnYBYjVVaQnlzMR7hQ2Qc2TzA
 RpZu52ifaXZiHMg5Mar6Ze2k7MdgcVdPW9cGHfREZ0dzY8sKozkJ9mQy7KsPY8p5+gWT
 /ReSNrqJL/gkMi1EO0tAX/qr262vbsr5/9LWM7j61JXhuXyGiSCeAQVueYC/3bOTjaP/
 ovAoITK9v4WCq04k0JgsLKacW2NqlKINuzj+JoHDi2ute/7+SgA0rhUtQw/Zy/KFr7LH
 dHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790096863; x=1790701663;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Yodo8FKkLRDwokUgHAxXrm1Z7rgg6LvvkpERUUT2ukQ=;
 b=ArePfRXsa5S0J5empxYGxCdaRVxIdCcI880BNe5vhAoY+v0mG6RbJBDyvyBjX98bjk
 6R9qLFtWF/jooivnDVsxJlAGfBfZOEl+Q6sl3TSj8JlAhZ7BD7dYHbh0MR3JjCkx5V7m
 PeuvOFbNvVeyvqlxl6w0x5riGFE7V+1xrYeveT+nTm0/NTtftrqI+j9SJ8/+iOGnCbmq
 Pq3OkhvjkiuuOxjCpsmlhSt0MiWX3RBiMj29NMibgcS3I1LUGUJqU0z7l0I6mmFCa1JK
 XwvgphVcNh+ElUtw2+h0SwwtWtm7Ztm06wHwioyrP6ijEEOG5V9cfOhO86l48wK8HY5h
 xYlA==
X-Gm-Message-State: AFuF++nI9JHAZlJk7Ds5iG+WdOTQJQO37wsdj+N4vUCmwJGF7Rkyfqms
 q6c7V4HMtcVmuyOs5qejSzJYxsSUwvcZzrbdyGU/wPk+Zs80Jvo7MRKYuD6NBkFdtx+ZhhNPaKM
 7gI/EF7tmC9pJtTkrBnXaNbIcZTXbOPq9r/tw8sA5aIpBCdYjTAzCCLdo03US6tXgW1c8
X-Gm-Gg: AYBFou0FwuHKm4d/+fy3tE/JO0c8ZL+AOpS3YBabO1nEr6jfWxyfUZjP89xA5GZOTDk
 NrBb5Lr9Z0B5Ald6rpmgzNIUcsVU7hJtbAY6kh9e3W6iNlsFnvYx+/mQslE/Zf+5vHYdks3ydfX
 Hm9r3r2nvMBy4fLLnjZBHLtkj1o6JdEoEA/HMUsLgb6z2+ocfUV6jBZfrGSG+ircr2Yc2z4x7yK
 pdSjljeyTo0yq3brYqZNKdwFJKZbOVUH9VHetK4JhoGwe7dG3qt0rh8tlpAl797EgYjKLpltnRm
 82wZ8nt20MqcYwph0FfUaCiqfR9HjvpY09JjlLgLNonUT3kTEB2wahnuLn4i5nY/Z+AfrJ3Bgxh
 URiJ9Hfpn7a03r4qsOLLo
X-Received: by 2002:a05:6102:b0a:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7a7198ad402mr7413714137.34.1790096863366; 
 Tue, 22 Sep 2026 10:07:43 -0700 (PDT)
X-Received: by 2002:a05:6102:b0a:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7a7198ad402mr7413676137.34.1790096862921; 
 Tue, 22 Sep 2026 10:07:42 -0700 (PDT)
Received: from [10.251.40.67] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde18093csm6008625e9.3.2026.09.22.10.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 10:07:42 -0700 (PDT)
Message-ID: <65c2d2dc-2282-43bd-86b2-476730039915@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] accel/tcg: Make halt-to-exec transition explicit
 and remove cpu_exec_halt
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b5e0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cA1g0hb8xVe5bm8CQ20A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 7UlBo1Z8Bo48xDjc_eN2V5JUUBsKCRjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX75wuNh9z34R5
 14P5PRGEurnP84PJ9OIRsgLHReDC3ftf0dvWDwCtfIARvPHJTgupdtUVI7/QtgDsi7viRW/VE6t
 xw3OfY3cZoX5q998ViBsQb3r+IibOStCYKVzWzk4QXmlp8xT/j8bt5k5xMzqdZzGc2C8OHTFNoB
 a3SWsW71PM4bBp4InB57kmS4oo/8PRu4BRAMkdF8UcsQinW5XJErg5lKuNu6pDDLaUVqV1Ti29h
 Xayon1e08aLtzI0CKE3s7fwL+fbcp57/xiZXWbr075xYLhbNgEm0GFPd9M7uNbFIDUYbCrLw7Q1
 DzyNYu8Sys9ankb65HWIYUrTw0RDfhzv4jTAGfw59Z2uXjgCDCgSxT2TOR76gg3G/NF3tqpuejo
 woyITpBlX50QATQvBypqGKv+D8mvKlmWS38kcU1H2jjiUW5AW5oOwACNdpeaIWYTr5J3fl83m7K
 fpgMKnkYUwND2pzW28A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MCBTYWx0ZWRfX9QkP2MgqSL3o
 z8Z10z0P3tHWs/tzPRf8ukjL1qWQCYmEjRr4DCtGxvKNWoTMAZRPPLGPP4EGQOYAVTroeFsfCQP
 Nkl2lxuosTZredjQxkNevK8B8QfoZZM=
X-Proofpoint-GUID: 7UlBo1Z8Bo48xDjc_eN2V5JUUBsKCRjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220250
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2026-09-22 18:49, Philippe Mathieu-DaudÃ© wrote:
> Since v1:
> - Collected Richard R-b tags (sometimes commit description updated).
> - Documented the BQL and synchronization requirements of has_work().
> - Renamed the callbacks to poll_during_halt() and leaving_halt().
> - Addressed Peter's comments by removing racy halt-work assertions,
>    documenting the BQL contract, and explaining why x86 #DB delivery
>    through do_interrupt_all() is safe without the BQL.
> - Addressed Paolo's comments by making ARM PSCI state updates atomic,
>    kicking remote vCPUs after power-state changes, and ensuring x86
>    APIC polling runs before cpu_has_work() with the BQL held only
>    around APIC access.
> - Sanitized s390_cpu_get_state() for atomic accesses without BQL.
> 
> This series was inspired by a previous thread on the list [*].

I just realized I missed Paolo's comment on riscv :( Depending on
how this series review goes I'll amend or respin.
https://lore.kernel.org/qemu-devel/CABgObfZQb8FwDubg=pZk6nRSrUgdMxoDpRwG3Kd=GwpQeccLhg@mail.gmail.com/

> [*] https://lore.kernel.org/qemu-devel/CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com/

