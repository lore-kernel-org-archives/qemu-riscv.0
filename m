Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C91CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT20k-0002IT-AI; Fri, 29 May 2026 14:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT200-0001qM-0B
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:32:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1zw-0007um-Ou
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:31:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Svp120694
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fZdOUyDKUIE6R7VAX/E0rIaldfJFcrWncy/w5G9RArY=; b=j+8BjOW8TDT+9kHB
 z7zAmFlZjajL219JNx9CGoIHin3ciyxlyL9vmu1g/Z7+GRtJ3SuA26nUjLKog1ny
 fZ+ciiw4h62tiWBBlkjakIIdnj4Ty2c9PcxnJuEGyk+ijy2p4qK0tnBVArKlg9EX
 ehAFu06WjW6yhJCwvGldbgKT3VAadt9jtIlwyQqQP7/R5PFc7kyglC/qTOGD/XnI
 oosF03XAun+SPVnKuKwdR/qos5sz5M7rTWDkWCj32noEOGPM7aFgWew5GzVdgiAk
 9TaaR7h7mWurMBo4CVaR1QzzGHhn4hVrI9Wf3NCZ3BA8e7xBWZlvn1lxk3dLWsDR
 In+8Zw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5x3mc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:31:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304e7fbfaf5so4543792eec.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079515; x=1780684315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fZdOUyDKUIE6R7VAX/E0rIaldfJFcrWncy/w5G9RArY=;
 b=dtjv+2R3S/MwzfbYYAUUry0jZhlhLSDXkJTAoyuXZWJ+GfWFKAA33mvzTjrckAqK+Z
 awlcr5qXKeT6bg7OMZ2r7+jFa+nmppJbQdNe2FtBi0PzUoKIFbohDH42LX2odBWnNXrQ
 KY/Uc3nkxEtsV9HI2HMRa8R8TLDd2eSXeJC+YyR49CKXfDD36wYKLShwtSSSpG8UGUiu
 xsoSOy1s6/1gtY5pcjxO5vjRFJrtlylC7czQUJDVtoBNIGchBYWT3bddCSqbT6cs8PoW
 z6yt6i5NKe0J5rR8ANzRciF0an8d1URCID0fzr/rSj+9jGZXYWBbR0dOQ6KReahf1KMW
 IS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079515; x=1780684315;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZdOUyDKUIE6R7VAX/E0rIaldfJFcrWncy/w5G9RArY=;
 b=lpps5kt6IOHJUkvccEORoYADJC79EeqlWGnTqMeGfzoMKxKaZy/f5ij2fG6EWGkxTB
 hq99lqyEJq5Xkw7M5CGltvJvy1zT6m+yeqfbKjTcJyx1igOaKGsn4IpZOZCUyjc50NUB
 ck7ljNGEe8/+M0joRsOQREO5CXFBsgTR5lgp8ZDAEMB7V1vE5yFTad6Ivcs5yO9Xr8yZ
 5yS787Os4nZupXnzrpov/NW3hYzs099+mkeJzBIHNzPmhUPHLKnt61qYRNsgMoP+ZA8/
 8P9hOpuorl+ttNc+lQ3JI4IjsXOfVtPEa652HWwJ9oCWux8Z9pWD2YgOv9ocoPniXK0y
 8GrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8COwxGgisimyUaQexNhG4Woodk9R8P/cEMw6wrZdqUwwNFWqYe2bUhe+w0H8K7JuUbQMY6iZTfCPw@nongnu.org
X-Gm-Message-State: AOJu0YzgYQixNBWmMpMqtjlqBbNiaM4cWQWzaKceRI3VSMLSX5wm2H4U
 4taua9O06SEnSsQo4l9dh2BPlBp+9un6iuN+a7z6quwYXnOzDSHCbnlMC1daALiq+9RsyPpinqx
 JG/BqOQ/fssJCMu/3GUmmll6W9u+v88dl0RFCVKI+2GhgiK++FKqTFiToSA==
X-Gm-Gg: Acq92OE1c3bOitiYe1LFzwsS466ppig7b+4HsS5U647jAwgnCIU81FYTLrqDjybtRgj
 ab0m93/F7caDk3WDiR6ntWJNnwYqWGY/c6b6Y0/1EqkQ80BEpVNVIpkhXWh2GP2n0Lo8i9RS1jk
 kzFYXi9KPQ+1YzngYbBPQVMfG2sBNUjNTEwEWd0iC1ktp/+1yAUjigBciZ/30ZpdhF6qHByB2JY
 XVnQUJ+ljlrAWxZPG1gyRvtI8fAvba1kd0M4eKPSAEXEcLuRhTBvCtPsMH9TSwkR7471qnSs0e1
 dVHHLacg3CPjbB3CDwRnqGRE33+vzmKekIsFqzHWAoryJMQLuYfIQwdoo0NmW71f49IE9SBb+ve
 TgfR7RIK/g5j645zRiG5s9hMSMFDXm6ir5l73ijcz+ryxMnBF1Oz5o32k7PrHoxdhACbQj1n9Ck
 UyZ66sfJfgeD6wNmSoR3XEpcZq
X-Received: by 2002:a05:7300:80c6:b0:2be:2cfe:68b7 with SMTP id
 5a478bee46e88-304fa4c81bfmr524479eec.11.1780079514690; 
 Fri, 29 May 2026 11:31:54 -0700 (PDT)
X-Received: by 2002:a05:7300:80c6:b0:2be:2cfe:68b7 with SMTP id
 5a478bee46e88-304fa4c81bfmr524459eec.11.1780079514192; 
 Fri, 29 May 2026 11:31:54 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ee0dd6fdsm1766111eec.23.2026.05.29.11.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:31:53 -0700 (PDT)
Message-ID: <1468c9b8-44e5-4ec6-98d4-d846498720ce@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:31:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] accel/hvf: Remove need for
 AccelCPUClass::cpu_target_realize
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
 <20260529142434.87880-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dXms7y31LvrQw7mezgKMNAp78zWSIvnd
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a19db9b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=S1AAxW5niS9ldcQwnDQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dXms7y31LvrQw7mezgKMNAp78zWSIvnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfX33bP83T+T/S6
 XS/YNEPp5iB7ELCgb+gLY4/xsk0qCgIQ4zvIu7nvHX30gR4iZx3cw/EcoyWIY8khgrJBtVKudCg
 dm+xuYX4zyyN4HnKoqIEA43u0CRMhQIkpBxZCeXy+9rvYRT22jbMfpBgM1bL+2IdRLnpNTZTUz4
 k4lIBOAKGF4itdEpvC34S6crASeA1ygjRtrkOcFpEfsy0Dl9DsYRAbM/K6Jy8SsiKoXhFg/suV0
 KZ9JjaOMzJoSXVdw9mpATXmft5EpbJC4Banm0fdRv9kOK9/KUeRI4xlvocOUoXqJ7EdIic7E8WM
 ph1X66bUcPqi5+Dv3EZwlOh5/cVfAEeNYJONxwU0ssGHjzrV0MdkJKvfI+wSt1W5AQsVa0ICTPX
 ML8MgeEfhuGnZ16koaTTIj8298goWVX6l1cQc+d4hgVRKKYtelKVCEa5P4SFLg52vImALlUGLR0
 zeVxuRJ1tmlvf8wMWdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290185
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
> accel_cpu_common_realize() first calls accel_cpu->cpu_target_realize
> then ops->cpu_realize, which is set to hvf_arch_cpu_realize() on HVF.
> 
> We want to remove accel_cpu->cpu_target_realize, so have
> hvf_arch_cpu_realize directly call HVF AccelCPUClass target_realize
> handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/hvf/hvf-cpu.c | 6 +++++-
>  target/i386/hvf/hvf.c     | 5 -----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 

Need to update commit description with new cpu_realize name as Richard
noticed also.

Regards,
Pierrick

