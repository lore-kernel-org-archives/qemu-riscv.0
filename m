Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8A6CD6E54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:37:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT25K-0006ZO-Sc; Fri, 29 May 2026 14:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25H-0006Ws-HF
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT25E-0001Mt-3X
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:25 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2OPJ030043
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vXI6UfcbTRBwXOG1ckDEU3+hF/6cF/O5Mft8nRuMTQk=; b=nSHaOJ2I6+dsVc0h
 ShoSNqz8UpAB2l8afXCIMdTEBQpMDKSmdxDsJBDhLbzWBwkTzzqnO+iNZiotZr2y
 F6noYLScfLfHL2/wmiE0NIgP4NuwCrj4ejxKbMImeGXxXgdJTpXVFVZfQ/bdI3BM
 RUDrptD0xyimFKaiItLr1uXhK8IUzObm/dqYc6rk9sc7Hy7hCkm9EMsb7fx5aXEP
 S64PDCxAxnvu9my5AvassB+AasZE8AYYZ9cFqIFSDdHhM03JbMAvw3qlSflciMQr
 FBgr5H1+HEGOWfFp19E5PmLmMC5gKnD0lCFEfeoK/tPPci51wNASG8e3vKk0ahli
 C8mM8Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumwebc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304f23c55b2so861518eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079842; x=1780684642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vXI6UfcbTRBwXOG1ckDEU3+hF/6cF/O5Mft8nRuMTQk=;
 b=MfUOv68TlNIEVwC7LAbRBaxD60UmxyzEp+9Vh8c3xm0/cvO7u3r6JtshLFyoJ6bYp3
 oRw48qPT2p6AKeMHkzQHojySVwdXX8DCcja0efjgDa1cb08IlyMIw3fMv2SHeL1l87wR
 idE2CrFUr8hL4w4s0nwZ5ODZV0eO/tgMD+q+lIfT1xn3/6tADy4uLVQhFlae4gNaoQ8N
 oZg4aYmLesHx80/sETz/MiGBaHa9edFdZj4U4fIe++exhZOn3/P//2gm+JrtOSPTDmVC
 SYPNASuB2Latq4B/V6Y52yrPBUgCTg6BCSzIqdwgblUPX1Edm/cMkMABKet86zBk0JDq
 AvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079842; x=1780684642;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXI6UfcbTRBwXOG1ckDEU3+hF/6cF/O5Mft8nRuMTQk=;
 b=LiUndAQg7Y4Y68Z4QGjNgXPczuQqbTiWIw4h42AkrZLLQFnjIK4cttJmxW9j6j7w52
 MTxF3L1BeA8jS2Z5vyKQ6i/eGoUxStQHyTWcS+ueSYsB4CjL1F70ZeVhAhpTVCrmgQGO
 uS0N2eme7fyewZMALL1xfhPe7H07DzMMLYYmPyNXNHyEDSRzTZvQ/0qnGP1ASB2dbjqJ
 KoUNszjwrZxedNRuK5Wi/p9rXSPCbJAROgPLNVAkRDUuQQe+o5SNc/WQgq1fsAvv5Bvz
 I5sJAJ4G8AsNu6w7OaVM8MEDWG2uDAufOEjWhIDuNuwxxR9z7hP0PO8lfJLbcnWfUEru
 xl2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XJRHlIX2yAOZchpqeHl49o177vgxm8CtB27tD+2TVWFW5HkWSvLuN3DTC63lkwPD4Gx6u9eb1qKSe@nongnu.org
X-Gm-Message-State: AOJu0YxyL28eeyj8COIvw6VISYF8EsMt/sYrMB44YxcpDmyF+u2CQVBN
 OYjy+MwwmebncQpj2egEAFdmap/m+klMMk0TwLVVeSk+EsKE/Ffk2PmpI4MlVyXzKe7fRm/wmpP
 7BhGLMNqtoCeWqG35RxzTDGGUJr48fziI5bty8mXtJPj+W1ClHcLLvoZTWA==
X-Gm-Gg: Acq92OG+DQhNoCWq1V1lmQEr5n4oHIc2c/jT6p1YuDhfOnoJUlljRr3s/O4EOCx7UST
 F5vAG5JryxRRPItiPNWRgzn3vyPmrbYhFOZm4qwM0KxdzPFboMR3SfQVyFPa6MWAeOgd+vtpsq5
 cntbd3DY+hsFrInaLSidEeILh7aD9F0S7c/PkQ4P+kNW1w9HZPveGF7iNryTIm3Thdxn8fVAIva
 c3aYpEUW+rzfy7u60LYQV8e3fL4VpXe0/yrfeLLx7hPZD8g3zjLsgy1Q64bdYSbk0A/JdlTUUvU
 7fllIc1NZsGVMFo+KZKlEca1QIDpUuBCPmnf2VYxQOVhdYHZ/XxLaIOQBrlKZanzTgxL84/G6HF
 te5ZMxVuDwCd9uFC99cLdtJViFyyXCiYDPEXdzWCQcokXpb1gRVHX1fNEAw9KFSMi+yzqGovuvp
 Ol0OWi5dtWyR/ZjnUQQlORrvm9
X-Received: by 2002:a05:7301:2926:b0:2da:2ec2:64fe with SMTP id
 5a478bee46e88-304fa67ab4amr482948eec.24.1780079841822; 
 Fri, 29 May 2026 11:37:21 -0700 (PDT)
X-Received: by 2002:a05:7301:2926:b0:2da:2ec2:64fe with SMTP id
 5a478bee46e88-304fa67ab4amr482915eec.24.1780079841314; 
 Fri, 29 May 2026 11:37:21 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c154fsm1873641eec.3.2026.05.29.11.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:37:20 -0700 (PDT)
Message-ID: <3e9be52f-58ee-4751-9d17-9de23b930283@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:37:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] accel/kvm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
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
 <20260529142434.87880-11-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QUGX62oCHbek89VzMwm3Rm-KQvyHLHfJ
X-Proofpoint-ORIG-GUID: QUGX62oCHbek89VzMwm3Rm-KQvyHLHfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1D9p5ExSdyQ0
 vy5zD2kRvBs9OaBtVT83Sn9OtzN6QPefEXk++BvuEvgnUHEn8bpzOLODq+LoIdB9lMCjFGVv/xp
 PTAWi6p7CAnbEI0p3y0SIt4pWmGjRPA1rN+0o/YRQWX+DNqcCnhdlIh/vK8B7fN8Ox5F68YQPyS
 J6MhJdemxZTFSJKiKTAiVnVZXWi/ZYCgmFSQoWitJ2azTjnqIFwgyPSITJhWjzax+Yq6M6saX2K
 TCb6IAnHKzC0Ww6l/Oy8scblM6EfxR/v65gQdtA6QwwNsBCLL601mGQ+RvaMz5gyAJb8CmMysbr
 SUR2FKygHuxlS9WJA+gY/izfmp1+Cn3bIdNfkrESmqPPIvSXltV/usqSQkwgTp5VXklkErYjveA
 usf52LpczDAiyL7s95BFdzrV4ItzpvFJX1b1a6uWlRpgbfWl+gsfpYaDj4s6OtlVbk0VEQ69MY9
 u0LrBmk1rK3IRl+Hi8w==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19dce3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QHjEocJm63N4ICSh5zwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
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
> Expose kvm_arch_cpu_instance_init() and register it as generic
> AccelOpsClass::cpu_instance_init hook.
> 
> Both X86 / RISCV's ACCEL_CPU_NAME("kvm") TypeInfo are now empty,
> remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/kvm.h       |  1 +
>  accel/kvm/kvm-accel-ops.c  |  1 +
>  target/i386/kvm/kvm-cpu.c  | 22 +---------------------
>  target/riscv/kvm/kvm-cpu.c | 23 +----------------------
>  4 files changed, 4 insertions(+), 43 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

