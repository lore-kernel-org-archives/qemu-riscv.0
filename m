Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0013BC44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wlkBp-0006Yy-Bp; Mon, 20 Jul 2026 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlkBi-0006YT-HR
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 05:21:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlkBg-0007xa-Sy
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 05:21:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RgsN1774809
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 09:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wny+pFIYYieXfGQIfChRa0oX9UwdTtf96vAUVTaW6cE=; b=bJJkt4j9De9Reovs
 Xc8jkM8/z+d83xcNnoEyHYG0yWZCmX12Zu5aGuf1qHLQ+CMCe3I/98oaodkRWKLA
 dhL3UNIeRs9ru9cyMIFsRv6mMr004luAScw8kWOeQpEW4Nsh0MVTh0s+2/nUtWz+
 sEx1c//1vJOVe9ZIx1CivDdYmyLPqxRfE4gDNSP7Gm5uuhI3A7izGIjTPh5YtN1g
 eB/ccmcS4jqRW6ibRBOBsWnRVaWQBfqcQhZSe43qalMWxcwPUUVKQ0TW+2PiubAv
 UAO9nc6rnLRjDsG55TB3ijVYa5JQNWNckhbE6InhIDEI+d1k7+4udekcdwY18Jb5
 p5bA9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af5few-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 09:21:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-520a00c7a03so96711821cf.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784539283; x=1785144083; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wny+pFIYYieXfGQIfChRa0oX9UwdTtf96vAUVTaW6cE=;
 b=dY/meE5iV6MptoOfrJ8BR3eJT9jnyxQLrOpuD2eXWZvcg7p0oDOmMCeMJyj5ONgXVi
 /NB41sEY9dS9rrV8XxEZMeKxgiuKc1sNeVt+GzvDhM/u2rRHlm98SYQLUPZ9ZquACyM+
 9xAoSdvSvno7mbx0vgmah/2jRblELYfpAYbSHIFnn+gVOAjZYZZ32DgQgRN8rCm9U2yw
 PKASrJyvSvfcy0t/4Hv0n8KuIQzJjD1NtrqyWXzjcnerbZFGYN7tcdo7K1ACbtvfjVI5
 H2Ghlsvv9AexqF0vaRUgke6mPnUbTI4uoDNpqWcO6DO+K539Ghnh2yz/6rX8W7nurniY
 3Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784539283; x=1785144083;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wny+pFIYYieXfGQIfChRa0oX9UwdTtf96vAUVTaW6cE=;
 b=Intq76k5bDdmrlm0BVuNRepfmMJZLk15AwYtMvG7ZTQelS9wwvDL6lj+sr+8Lwo/IC
 mrRQxONk+7hayn0BtlOy10d4UscNc9P5OMT1TgqNmivNnmuBv7tofdAk1cSJSiTqP6CW
 7jqrp9zEx/Hnbhv+AtAiAL2r7eoK56CCGR49m1LCfqrphlvDoejFOJPHykTeBYOxGc6V
 3XwrweoXWqaCbGbh96Bm9tnuMALmT0yKC1Gjy+K7yjWCmaH9Fmh1lmLRVPaXF6sOSCH3
 3cdJ05cZOvN0FBVLBuuSjUbEGEZODTxAhZiEHW4RuD0ktEZm1BRSWsqqBcU2Rb27ssDK
 x4XQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpV25doKfxSiwe6UAStsimTW/X+4qX7Fyog2tzPnjZXfDSRiuVIvtl5qw1axMkJ1RAKjZFse7FhpG1Y@nongnu.org
X-Gm-Message-State: AOJu0YxKsH6CIeqE8npgUW99lULrrcniDSl8xgbMX+d/dlncr5i55qLK
 VeDuzmhWHCLtC5k85Q6K3VlG5v6cyQEpTEbUYQHo09lsifJ/wyx5+QeoCHgOPkxU+THfI4+ZRnx
 VtUlU+Vu5bl7Q4mTvMCOczDzAG1Z5KX4xrwjinerUw/HxA30KyLbSwZmmYQ==
X-Gm-Gg: AfdE7cn01q/rbRrCclwGnohQlIDVq131NZGnxj8nLg3wTGLoFXWULhoWNgAZbxBCgtH
 i/+rnOC4a8+9N97Q0eXj3/9mXYeE6wwTaK5APP7Ns5necvIzRddjT67xFMtRjIR7/exUHPKpDss
 IsF1d3GkjAlg4nLVgQIxCTNNaaSix5ew4qYYpl/4O78zwYLQHQumE/8Y2WupEXuSFAQl+26k467
 FZfQG8vymL5JDr5Fhd+N4CbcmFD3muExjjg905iNn8BpeQGIr3mPMigg0Z03nXs+WVPKmDMcekY
 LqasxBpCYbr0Yy0hN+X8Xdhb3MG4XhjuwznevsSf1x4Sznasz0olYFJPOCwrmHt/y5BghDR+mjR
 uxqZU6YInaYYyULINL7bwyyAe3K/Nx9lpg9vY9XpmhNqWXOkDhSE=
X-Received: by 2002:ac8:7fc8:0:b0:51c:7b11:41a0 with SMTP id
 d75a77b69052e-5213f379a67mr121334951cf.77.1784539283201; 
 Mon, 20 Jul 2026 02:21:23 -0700 (PDT)
X-Received: by 2002:ac8:7fc8:0:b0:51c:7b11:41a0 with SMTP id
 d75a77b69052e-5213f379a67mr121334821cf.77.1784539282743; 
 Mon, 20 Jul 2026 02:21:22 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm26486942f8f.35.2026.07.20.02.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:21:21 -0700 (PDT)
Message-ID: <0a880952-78e1-40ae-9600-559877479125@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] hw/riscv: add RPMI FDT helpers
Content-Language: en-US
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-4-subrahmanya.lingappa@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260714075659.2258023-4-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfX+E37D25eehak
 0Gy84i/K3GUT1NBA38L5fObP6xiuk3SYC0kY5p3e6xFXT3ed4PE49XgAYtCLYMGjDVhDcP4qZ5F
 6QDWTSu8wuBLKz7kKMLzuaLAiNFoOkk=
X-Proofpoint-GUID: cKu9aHyHKGOGmySWE6DFo5uzg4gVnDle
X-Proofpoint-ORIG-GUID: cKu9aHyHKGOGmySWE6DFo5uzg4gVnDle
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5de893 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GI28Jwp6_UHTV3f1XaUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfX605vzig6GVQL
 4Dy9rz9r2NpwLqRe/llkUAcjdj9JtdMzC5dnlqqJOJJValdYavj/cm2zNCfao58PvV6OnbyPsvZ
 xk7EfFbMaEZWsQIMT2+V3VylDM1bQKZm024MHE0zTMU+Oq0c4VHqFnJefdyxjAqzvrr/J+VuUGm
 cSAZTtozbTI66eK+r0jVC6mrAOUwxcsq5PMl9mWhxuK2dNojvkejJGz+I+7U5abkgEapfkQpBDA
 1otBJVEB65DKDhJyYRKyX3ZXoo1cYtNN+0o7A3bu2keb5HOE8PIeWajfRQub5xjSZKBZZXiSwrg
 4Oxrh0XICQ1M4VDmfWxQpGelB1ET2rSxjS6sUcSJdd85t/qvpjQUobZNI2+hv9JoWnQdkWrxac9
 EkZ+bWYis5EwBZjSCMTn1rp58L0k7IEP7T16ZvcBuNAAhjgBpink4NP+woUABJMhZbYLm4E08fc
 v8HVK7D8A2LrhiNJnRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200103
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

On 14/7/26 09:56, Subrahmanya Lingappa wrote:
> Add helper routines for describing RPMI shared-memory mailbox transports
> and service child nodes in the RISC-V virt device tree.
> 
> The helpers keep RPMI node construction in one place so the virt machine
> can add service groups without open-coding compatible strings, channel
> IDs, interrupts, and shared-memory references at each call site.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---
>   hw/riscv/meson.build        |   1 +
>   hw/riscv/rpmi-fdt.c         | 103 ++++++++++++++++++++++++++++++++++++
>   include/hw/riscv/rpmi-fdt.h |  30 +++++++++++
>   3 files changed, 134 insertions(+)
>   create mode 100644 hw/riscv/rpmi-fdt.c
>   create mode 100644 include/hw/riscv/rpmi-fdt.h
> 
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index b70a054579..529ec273fd 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -3,6 +3,7 @@ riscv_ss.add(files('boot.c'))
>   riscv_ss.add(files('fdt-common.c'))
>   riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
>   riscv_ss.add(files('riscv_hart.c'))
> +riscv_ss.add(files('rpmi-fdt.c'))

Doesn't this depend on CONFIG_RISCV_RPMI?

>   riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
>   riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
>   riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))


