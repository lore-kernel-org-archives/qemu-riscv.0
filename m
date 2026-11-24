Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B0606A321
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/fGYt70;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZF4buIG6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVvm6-0005y2-P9; Tue, 24 Nov 2026 14:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvm5-0005xc-0e
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:01:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvm2-0006aK-S6
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:01:52 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOIXG4H3000182
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5XOiR9u3+rfv6OXl00b9tM1JEPzBxW8eRPbkqYeUAyE=; b=K/fGYt70ODOpJTBM
 wn1oEpXzlmc/9nFwYMavxIvke394Z7P9CFpJbE21HdJwMYVQhmoFdZoYVtXM5xkn
 122RjquJm/ryswcXvMQd4TAwc4TV4bAECWwM93ckq48zLKa/cSMAvGHgPMQrGm6H
 5+mqTDw/lDh/Wy/RZmT4fKyj65CCELl8yqSnBDszfMSn2J4gmyET7xWZPXF3Iuyk
 1tJjDl0k1QBPlqijZ5zED4jtEbUBLcZxqBA6sY83EUvixmqQAaRGvIoTPQVD5vV/
 B1hE4qhAbRGqFXmEV/rZAG4Xb+rMBiFXt/Q4IUdyP7fJKxvj8Ww+tZUJk5jCk4Pk
 nZKe0Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00gcyp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:01:48 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-836c416b236so74440807b3.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 11:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795546908; x=1796151708; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5XOiR9u3+rfv6OXl00b9tM1JEPzBxW8eRPbkqYeUAyE=;
 b=ZF4buIG6L1N8Xcv22CzNNcHEREcel+71RzhGINsNptWeSkU4JF2e+Fac0q5mAVlALd
 KwXIczNNB62jPD+eW7/u6lq4mzv86zia3/+2Ygz4xPEk09Br3ktnd9JeoUs4huFSjcyo
 djxob4mzNu4oAo0Tnndhk3AxPfYNttpx99Va3A6graan2T3mUkkIRxrIw9XgBUrjcHaN
 e0v6jDN/N1EWLsCChCePL/FtfDhiRckK826+PAzQg/4XvRkuj5nH8kKsRGd605w/+Vxx
 /DCHZS9edW6dcf9PUkYeTXTD20QKD8Tal1r6+d6kTeT1bNZaLwtTudN5ADcSShWD8+dY
 mLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795546908; x=1796151708;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5XOiR9u3+rfv6OXl00b9tM1JEPzBxW8eRPbkqYeUAyE=;
 b=bHGFNh5sI+ca04E4zwIyD2R/finYJmXsEmFK0TxcCay6OwfOBQZjiaRzsXUa1YrQMf
 t26ezb4OfJcih6y2susCHsAnzwzHZRNGXUXUZRaj1vVi7t56iJE9FDjGUll70gB2oLN1
 iSwWqr/mfqSsWRNWyjW43nqCGUpCu+TfCNjVrEMec32kVF4h4pLRJ+mRUzhGJZCLWHDx
 AHwERvcxnXUdmMBFsohQEYT9OoOANjW5Eg/5Rtfj9+Dp0k85zWzjewZxrJpRwWDOHI3Y
 wP7wRTdF68oJd4edhqWkOEQFUiwnzYXlN/Jq5DW1N0Uw1zdwCm0D/+p/guYdrbf+JXK0
 liXQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHWJ0uKCWw54cvSYQv91ZRJX6s+K+vXliAtDCoGanvRv0z98NId9iV+zD3xFgdq/ynFs8OIe1u+LzEi@nongnu.org
X-Gm-Message-State: APuU4Z+v42uxeFv37E5l9I6OE1Nqu0d6HsWcM+uXX8zkZDaAtCBTsvXm
 kvkduWacHW03UFkpqjkKB8qpllHGUs3R+mU1USLh9dMzevkX5NKKq6Gpdzr774VwbMOWBkX3jt9
 fKYYg9NPmPT05YJu3FMskjBqzL3fZDOxO0uK41MsUDvJZJb9Nb1QcLvaLqQ==
X-Gm-Gg: AZFdTZdzfJDmlB7PwRpbwy1uW4fKJGQYyLPc6UHZKKyllof9FGQ9NE/JA2QegxI9Y7B
 G7zTYcYMyxyqhu8VaMntiw42RbIj1V+N2Ch626gJDOy3khfBsJO8UNquw0UPvoiEpube6jIpx69
 GxgAj0lVV93IUbcYetEWLjvsVdMghN1pwt2hnIwZ73irQTqGO6LFY1prk/Fh9xh5m3qr5L9gbZQ
 MLrQavb+frCQ90C5LN/oQpiYDdfAKcMZ77K2h8ZYtTQ4uJ/AlQclZekDsvAMIry4zUAOjT5cZmE
 wUrjO5URzvUvRl44p3sWwyEwLDVBnF1MrM97g8nNa6IzHFxify/8zt64tvE5Zfe+i3BaVJIxVUe
 Rpw5QJzQTzT+vGZe9exaHnlcXyIGMw/92LAoPwRsqLBHKt9TDorYzpg4LqdZiTHZ5s1pCqw==
X-Received: by 2002:a05:690e:130b:b0:67d:c106:bb72 with SMTP id
 956f58d0204a3-67e324d2738mr1462348d50.117.1795546907590; 
 Tue, 24 Nov 2026 11:01:47 -0800 (PST)
X-Received: by 2002:a05:690e:130b:b0:67d:c106:bb72 with SMTP id
 956f58d0204a3-67e324d2738mr1462305d50.117.1795546906960; 
 Tue, 24 Nov 2026 11:01:46 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb34ac1esm1111995585a.15.2026.11.24.11.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 11:01:46 -0800 (PST)
Message-ID: <ff723ec0-8e8f-4537-adb3-94b1a5b51711@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 16:01:44 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: reject shadow-stack accesses in
 Bare-mode translation
To: =?UTF-8?B?6buE5Y2O5oiQ?= <1112433017@e.gzhu.edu.cn>,
 qemu-riscv <qemu-riscv@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, palmer <palmer@dabbelt.com>,
 "alistair.francis" <alistair.francis@wdc.com>,
 zhiwei_liu <zhiwei_liu@linux.alibaba.com>, liwei1518 <liwei1518@gmail.com>
References: <tencent_5AA0FF1F62236004454D3317@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_5AA0FF1F62236004454D3317@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MsGx_M73kPggtR3j6YIVDLwr3QphrJp1
X-Proofpoint-GUID: MsGx_M73kPggtR3j6YIVDLwr3QphrJp1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NCBTYWx0ZWRfX66WetC9Aix9U
 W2vlo2wwqq71+bUDi0g8sniOBpa7MMiY8KYz8ti7rHdKKpn+05dDDHzIew6p5Kq4ECwI7jC5abB
 H7zsRQm3DzT+N1eSrEh4RGUTWT7vPSo=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05df1c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=n683re5pXfxIVqmLlQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NCBTYWx0ZWRfXzci4bAaNMY4S
 nKto7yruv3yUkZVgvDPWxL14hI+oYmm3SSO78KvFJYnUKUI5s2CQQyLAcZGIYClGv2Yp2zPtGzD
 hH9fvaxz2pVG8OzXCpWigcSsa/WSPLC1LPDcFAJyHoEuNDG1zQHBNcfs4V2k9uH45WFfMCASI9U
 ODlFRMINmOO3aRTjgrVQRna5vpftFcPuyR5578i2KijCoYHrOXhkgFT6AETyR/GRTl0cKW7B8ou
 cmI73mYUi/0v11F+1FMtfkz2il9GKP6YJieYIZOuwLm8l4vO6NFIzIwEpylgL7dbu9V5Nrj2oyl
 jhPZTvvkLHdr7CLh7cFEMNaESudHxQgRRKa1kQKzBdV8gVxjH9Kj9i32hWrCn1WtDoO3V7sHI+M
 +xZP1IuZaM9MtS2BsCPpImilReGveifhwrdy3+viTaj1+0K1jnSPFixllrYTMcUZWUhutjUDjYP
 jkMcs/LhHTtvYQRwaYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240074
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/22/2026 2:57 PM, 黄华成 wrote:
> Hello,
> In VM_1_10_MBARE the translation returns physical == virtual with full permissions for every access, including shadow-stack accesses (is_sstack_idx).  With satp disabled, sspush/sspopchk/ssamoswap then operate on ordinary physical memory, so the same ROP+1 pivot as the page-type issue is available without any page tables at all (probe T27 exits "full pass" on unpatched Bare).
> 
> The Zicfiss spec permits shadow-stack storage only on shadow-stack pages; Bare mode has no page types, so all SS accesses must fault.
> 
> Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
> Reported-by: <SENDER>
> Signed-off-by: <SENDER>

As I said in patch 1 we can't accept this patch because this is not a valid
Signed-off-by tag.

Moreover, we have a patch that already addresses this bug that were sent before
this patch:


"[PATCH] target/riscv: Reject shadow-stack accesses in Bare mode"

Cheers,
Daniel


> 
> ---
>   target/riscv/tcg/cpu_helper.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1088,6 +1088,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr addr,
>       case VM_1_10_SV57:
>         levels = 5; ptidxbits = 9; ptesize = 8; break;
>       case VM_1_10_MBARE:
> +        if (is_sstack_idx) {
> +            return TRANSLATE_FAIL;
> +        }
>           *physical = addr;
>           *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
> --
> 2.43.0
> 
> Thanks,
> Looking forward to your reply!


