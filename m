Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3622606A31D
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+FxSk9S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpG7J24R
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLlrq-0000B8-4s; Tue, 27 Oct 2026 14:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlrj-00008Z-Al
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:25:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlrf-0004xY-IV
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:25:42 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHRYo2945848
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=; b=I+FxSk9Sr95xLB2X
 uwvSjsPgTHMJgc5OGaqC61pP5R0e2i4mo3aJTnNe4SNlZwvqaVbnQPRf8dnhsN2C
 8SkDkD0vXIE79p33s/2Sjm5JbtgpTFjp5cAv2XjDL15Kl5HNPFAFi0ogUkxy7p65
 o1OhVdAZXnayylAEEW1OCEXaOtX7swCII77TaEZjk7uNQHd+KEZoeCTiw7fSP3o5
 5hEQIWpJBSqgnHQdbgPpeBrNrdcSIoXM+wDgDomcgLWJHZ7ZVKccvdIJBFgA+E86
 tUEI6pyQl96fQ+jqOGz3r+T2V/+ywGOFkwQlsNfchB6EeF0f8sMDTPeJmeONgkl6
 DcpFQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6aett-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:25:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb98809caso12583385a.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793125537; x=1793730337; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=;
 b=dpG7J24R7NYB9HNb6TDkft9vXsjq11cSXw5Ju182UmHprCTLtcZnivCtUPV6ZKzqA+
 8UNkVI1ECq+hkkgDFJy8hCh6iFk5r7XJjFulccU7H4r984OBDxCRi75I7WX7M3MeZmyS
 ulepgIKSZ72K/V3buaLfFtHnR+UYa6/7Tf+MEAjxA/aM4SYrvKmI6njTpWAxpCQ6ighf
 rWm21KPuEQjZvgiM0qpHHDFvDLi3zOAhd0sawwt3iyhtfa5zwLytXJXOzvrjjsCf50bz
 W/FqCKB5XN2xHp+78ZDMbAik39LBQHhKQnQGdIe76ZmjPOYpBUIFoBND+4fPytrIiCw4
 2+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125537; x=1793730337;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=;
 b=hvDdBuuXBzHPArj3mxkgoRcBoLvp2D3aeLBFLEw1VF2lkXpZlVdSO5QgfTKyZodtZO
 fmTydAWO5UIk5Chsm95GgYklHu1fhf6GJ2DqRptufsT1I71HHmnYclYL8ZhMYrWXRtmA
 /EFd34D4PnMsQmFoCDGH7/ktAkgVSOj9fAVwK2E7AbmSaskPy65f3T3JCSAnQdMHPFOR
 jyAyJCdIO9ExdWRKKhsLZJVRdP0q2/q7q4xFM65sSQeMiiFJYK18BljFNkmvw9oLx9BS
 hgI9QKRUgizsHdBeffGshsXBn4kDHZl1mKstbq3kOkjs7ZCHbdjLTIY6VMRD2ge3Vz2m
 Lmgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4xZI7o1ZP7X/UEG5grtSb6TWK8x0rE8WdRNXRNaxeghUSr0A2Z6WKcQEkFucv5EyFX0wEYdmTGuuL@nongnu.org
X-Gm-Message-State: AFq9FYL+ksmrYfWWzifSn9gVn1P4TAEOQ5TPxA4fDCSlwnqawByOfbAJ
 wuoZh4BEjUQ5zVvDTNdP1fhST5VPUrJP7nx8LQ1VFIvyFE++uTQv32UkgMQmciUf2TPbY0quS8a
 iNsiBt5+X6nCn7NLp7k3wQSrG03NGgq493KW3YwIKIVxqOoKD6+W14cc5Bw==
X-Gm-Gg: AYBFou20qi6XIk6qelhOX5R6jGrXqaRhV/v2EEA377RTC7BHCKavevY7H5sm/Mpt5cT
 aKbyn/oLuXF7PZ+8+WCzoQ3VF21FNMNMom2rTVt5RukK+tE6DQ871TSxcRL3/55qhnlK9ksAaaW
 TsCj5gFGyRcGiqjzVtraEf8g+siKZy/7pV1rEw1+vE0DN3S6EtO1FOuBzk/wzZ1PVF+sheND/gE
 aZnlLxC1vARqqJNOTcMuI3tzLTfEcUCKHXJMG5nZ94x9KKX9my3gvHEl04d9WtzHm/jkKMt+G0/
 jUDz1bykB1MoBWQ1NsmDUyqzrq5+O3smv6WtkuqTQHMtSSQxEcpU9mI15tyO5IlNc4xZfZF7gfR
 JqOoIetXEwLUBEGQaTbzmsesPRzXxy04uPS7V7VS8wgT32uwM2A==
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id
 af79cd13be357-940ef8bbf03mr1581124685a.25.1793125537165; 
 Tue, 27 Oct 2026 11:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id
 af79cd13be357-940ef8bbf03mr1581119785a.25.1793125536648; 
 Tue, 27 Oct 2026 11:25:36 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd37f4sm28457361f8f.44.2026.10.27.11.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:25:35 -0700 (PDT)
Message-ID: <d17c2d21-4b82-4fff-b08b-56cfdfe8a61c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:25:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hw/arm: mark 'virt' as a secure machine
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chao Liu
 <chao.liu@processmission.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Sergio Lopez <slp@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Xianglai Li <lixianglai@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Song Gao <17746591750@163.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0eca1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=XauY5eRjrSQ0cOF71_8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qwOyq_kB8a_SFfkir7YUWXLIWwlv4VEc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX8+1qm65W/Q2d
 epMBYVPk3g5izNISvmGvkDc4HogiX6p+fIIHcKU1qNN+lQAqdwsa9caa4VjWQldr/uIyRnQ2Zyf
 gmjxrHEFrVylrUKpFijFnftW7xCszt0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX9bXnvbtD2KjF
 WS1qBU3TsrFlHtYwIbkf8BBmgHSLFNipWst9ZctdUIgJD2pvYhSi3H5soRvoTMGw+mvy9aHXC0V
 9uGXJUpJygctU8IukiWMR+b1gFrr0fR46tbarWAsUJzL6ME8/l4GEJQ3IYrfpNOGqd/qnX00BcD
 AwBAE8z1/ezMb8TeHKbK7Bp1SdClMALsvXxlYgHo4XJx6maElflYoHBYhatVc77EEXIY/Vl23vT
 dFHGCWrBazitkP7Mixa7Zvrx4TgNNit4lfMBIgOgL6tk0/JqH4DsydvTcv5nbGFsFizgHZXMm+A
 xgLaegHtNemfuhfvO3P4IZg+7fJgBuSN7+VofgOQIxqT8emUJO1fOWh1ImMU7e37e8rHqwig4Z/
 lgW/duwirubTsnURz7a0R5UPqI842tw4WQ5aR83iNpLbzH3B+Y+z+D2rccGLX0XK7nikNrsC2wH
 OSqqdeoZh8uBgx1EYfQ==
X-Proofpoint-ORIG-GUID: qwOyq_kB8a_SFfkir7YUWXLIWwlv4VEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270073
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> The 'virt' arm machine is already declared secure in
> docs/system/security.rst, due too its intended usage in virtualization
> scenarios.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

