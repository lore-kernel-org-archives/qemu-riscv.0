Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D26C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uL6-0000Wq-JP; Mon, 31 Aug 2026 01:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uL5-0000WX-E4
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:13:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uL3-0007IL-Ub
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:13:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52VHX2423203
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ZALYRD1aQ9D935aJ6Dh2xZjV11uiz1ojb/F5smlCkk=; b=keR1nF3fN3pyYknj
 oKSQacedAKWUmF4sp00d0ByYysJAqley2GoJq3WxpWAxYrErSUAskrkeWZQkmJRd
 yuxhdKRYfl0yzlacIqdbgR6opwM9cFbizScOaGudeVW8WhVLiWuZzmtvgPGF7HT/
 pmukuqFw3kWrJiKrpHobV1hudBVxND1pJcIGmWrBzzbw+AfbLeE9WCFqQm+1F9R8
 hAG4m1GtV/rbJN6QovnEF+GDeHw5KDSrhElEwidIxVpfXFwAShajRCUPBuasJ+7P
 52ZrCn+cvzOoQ2i1GmljMkRlTKd78q8hfJb+dnuLdpj6YwdyYyp/HgnrSsnBkYOY
 Dw5GRw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2cnwf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:13:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90ce8ad8002so40878346d6.2
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788153224; x=1788758024; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ZALYRD1aQ9D935aJ6Dh2xZjV11uiz1ojb/F5smlCkk=;
 b=QleYw9+7KQPw6s2BblU7Dv8VvxWXfi2Jpg3biV8EK13IUXnV5WOEiN5BoqdrBvnW+x
 PNmCacYCkpMxHIk1Oy7NaIIJ0B4Tvx8ABrb2Fz8Sk6NBAp+3fxTRALNkL6w3ijgOLCUq
 J+2LlJTckkMx9EoGgRuOE8yTWQDyJbkfBBfPeaU0EqVknhfB3P0elvKxepciyO7LROP7
 TyKqVmK95bped4XqH9XHNTMVmNEqPBAE3gNUdZ030qoyZ45gAeySxyjSsNWlUbPJ1jxG
 6QcMYc8D/815MIr/t7mG8VDao2+l/iQR7c3fQlaazN7FxiZa6K2RQlC1blAvVcdh8HwE
 P2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788153224; x=1788758024;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ZALYRD1aQ9D935aJ6Dh2xZjV11uiz1ojb/F5smlCkk=;
 b=P0PTiTNU6ceRaywV4aqDi/8xa6v4s8wGuXJWhySJhOBBVKv2GW+Qo683J7kH/e6v3C
 TvEf0+wMLC21aLwV6jQ0AbEwoKr5+POfwqlxmXiJ43ab5OkyFGp944FnJ+ulf32F0vUL
 XonA4IgK2TVMgaMUPtgwQKzoaCDNg/xQ0YsRDCjV6ubiI5uqKtG34W5nbA18m7rNoVXx
 PzYdUdtBPOTcz6aPBTWJUoWoIm7oH9V0RvWopVIkSoh3Ua8VVC6tN7/h8OHQpkqLSyAZ
 MS8CrKx8ykOYlr7U9w9ImSmYUEmrwzKlqGmaRctnvVgKsmUNJ2ycwfecihm9Rax6AfqE
 nugg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rps1oYLRHcAXFVBdMTB6DJU+klnbBz22Lgz32mT9+Tjz5MveQWfxIHee3RWEJQlhfRzk/YQS+yuCKyc@nongnu.org
X-Gm-Message-State: AFuF++nWx49vet4pBdnDcR70Krbk27ySshXCEIlUI8DGFwsdO0rkcn05
 XWpi1qCROr1UQjvHcbkLfS2U6ZTVLlQ/bQJ9zcgS/Nip0qBFHHI60ytwjdVla+b9UFLfH3CfT8X
 uEYMu9jo4j6uCY9G2N4SkXMYm0tF4tNYdD7TDjxknP4FklHOxAnhJ09Sjmw==
X-Gm-Gg: AR+sD12BCWk7LJqwVaRqRHk5u8yVtZc0bga1x1s5fKE9xcn9C2kzQdnUieNvu3iSK3r
 HWvEFPfF5C0rbGL8eJB4COdU/h+tMOOKjCKE4rYelI+n9lo+x3r0mQvSQH2m+uHrLzc7M2HcXlZ
 lzsO/M3ObysUCOGReS6tOiRsRFbUclNInpSIkmLscO6IgwqwKzGnK6vvbg29KHTm4QR/VHyXGoQ
 xB/faIL5SsQMCgfF+iBuoXm1e9pfc56XhltDux3N+s2UFmY5ms/p8vH5BRFQb7SvjkyDyDJC9Fs
 UW2YRtMlMNkzlC7T7jD97p1n/0zNty+y6Xij+bl3znAhpMX3M1pZ0GLV2ZsvaOqIzVSVk2A1fcG
 YctS3Uez6X8rPAixnFPkbXKdo4NBByDA3MA==
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id
 af79cd13be357-93913749780mr2395562185a.3.1788153223891; 
 Sun, 30 Aug 2026 22:13:43 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id
 af79cd13be357-93913749780mr2395559885a.3.1788153223455; 
 Sun, 30 Aug 2026 22:13:43 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b90f78244sm298276815e9.10.2026.08.30.22.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:13:42 -0700 (PDT)
Message-ID: <e818a3c9-be27-4d69-95e8-3bbaf08b0f31@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] hw/riscv/atlantis: Rename hart array 'soc' to
 'cpus'
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-10-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-10-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a950d88 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: pwf2cxNE-oIcvSlcbVqu9k2j_p2W5Tvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX5kELsAMo7pzW
 XebmQx69YqxdavV9VuTPwX2HzBH+Xvw8vey2/B65tciDFpFd4HybMSFxhc6mPTUN2OjZLRdp4g1
 TcMJwUfWirf5xs6h0+7s8EemxGHeX76UlnCuS05nSYAnJjss7AqRUtAPb93MragzI16FwbafNac
 94/lOcZmiJScggGEveImTmpoaJ+344abHXDP2M3Lxyj+9Fahm2cuUBvewpcqbVliscUZQUXH6/e
 vk0MC6r/nqRctYL2ExfyVHRFihixSOatcTA6h+NXLTVws5i/I8YiTcwx9cb6nSjNJwyopeemWxx
 ylriBju8wkiXb6x/zAXJ/o2Rh88yuk/uy3IS2HPkndWR2hsTU6vo7b/mYpldpJ4Bm8M2ElalUV8
 UdRE8LF2eiD0BOV8TM7tTQh99X1tD7m+Cs3z5A0ynpD3w0oTzYblY+oN3CBgGNbm0RL0VCUsDu4
 FOz9O4rTQ81gbpP+gmw==
X-Proofpoint-ORIG-GUID: pwf2cxNE-oIcvSlcbVqu9k2j_p2W5Tvq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfXy9JGJ70WBy2F
 JIcsL225D+O9Zpl4ulGlbj5jdyWf+0ZW7cOyvskT9vJjuYLXYtHxblFJF3yxFrrMzBflEFIXIl+
 AJQVr1WTej7Rmwcz+cxKZYBZXSUNQEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310042
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

On 31/8/26 04:14, Joel Stanley wrote:
> The RISCVHartArrayState member is named soc, but it's an array of cpus,
> not the entire SoC. Use cpus instead as an accurate description of the
> hart array.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/tt_atlantis.h |  2 +-
>   hw/riscv/tt_atlantis.c         | 34 +++++++++++++++++-----------------
>   2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
> index d0cca3b02424..642490d21743 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -29,7 +29,7 @@ struct TTAtlantisState {
>       Notifier machine_done;
>       const MemMapEntry *memmap;
>   
> -    RISCVHartArrayState soc;
> +    RISCVHartArrayState cpus;

@hart_cluster could be more pedantically correct.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


