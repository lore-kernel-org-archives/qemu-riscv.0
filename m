Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D26DC79F9E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 12:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3Y9v-00035k-4E; Mon, 07 Sep 2026 08:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3Y9p-00034h-PI
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 08:09:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3Y9o-0006TU-0C
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 08:09:05 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687AmsoV2652187
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0jHtTGREXemZU/LhEz9hMJ4+IdOhXCA4mOuFJdnUzjc=; b=isBhDLoq2JkA8RQQ
 R5EYSRrFPLOBn/xyEEo9tD3m47zUtJ3N5mnd5RWwJaHiWqDU8DE5xT4LVfRBaHzX
 Hd1JqQUlxCR7BDLD8T7uAtwp2988IRaCpa1wG6HSamwYJ8yZgaWlgMCxJ7sOjL28
 PBucnbkeA9usAJc4YV290a9KxLclksawlqumvPTcOQtDjlP3xr8r68vcjxycWbWg
 M1LlOnu5zPdHe5jCf6QGaJaySA/D4DNqFoGIuyKVSvrHI8yvRriJL0G+iOqhIqzq
 5sgvC4hvylstk1hzF5FYbtEzabEx6nKpxjJpgvpNFU8hw7oT2pDxhYp9n4Z9fLIM
 5XVdIA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0j05-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 12:09:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-8461ade272bso42440927b3.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788782941; x=1789387741; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0jHtTGREXemZU/LhEz9hMJ4+IdOhXCA4mOuFJdnUzjc=;
 b=Ves5yKHDNBI7TU9YNwwMDOM/dzt6sVJMUpP7FGFqHuDwaKlNxz5u/tatf2vZmwcZQD
 MU7pRbotjmkJ9ls+DCqnT5YQigU7PhyinAMEiBPp1Af8rIIbQqL1FXdT0XTj27jPT/lO
 60uRVIjtCgOLeG7VkUTOVV4FU8eixyhDcVBdJUKmjswBYuWJZoRkVP6yTOGtwjCOqWLT
 PEywluTjCKJm/vQt2BcMt9UFbej3uXb+6ONqlDsPICUIokzAibm99PvESAXW/SYbmqnQ
 KEr4qWOsaI5e3rncA9RD4WsibvjrOhFJsWFmZkAtHO+gWX6BkkMO8nn0wECqWaht7w38
 u/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788782941; x=1789387741;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0jHtTGREXemZU/LhEz9hMJ4+IdOhXCA4mOuFJdnUzjc=;
 b=C9nsBJ2sxMsCVfhCmDv55zhve/6a5xwZOwrvPpW9Jq/wh8fuu+DJmX0nMl6bAnzIu1
 nRGoYjkE0QXmd3AlaLaQ2uVtv1BfAhfXGVf3CUyJ89gCVF79uJP63u3FjTE4Q6L3LD/x
 JDJwKoyQEOUMBYz16HANaBfFcecquj0OrAFsWS4DI/Y+9+L1PWwdtbVM06xAFGrCFL2X
 Ahfk7lftObd+zLU7Jf+TnTCL1JxpBU7aT8sZcMsdtAWeeD6kyyU3xQlVqOPc2Dt+NytC
 BCEiKt3SQ0gjvQrjI+UMPiuFdqZd0DxsjY009DDaRLDbL+16KUoMvHSnSqGK96k86fkE
 c8Jw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzv+lhcDAph0AReTVv5BYubuKxsBoDoDIImSi0jBOrD1EIIep+Fuzl9cqrmVcIAN2ywzULESc+qmrCh@nongnu.org
X-Gm-Message-State: AFuF++mXgG6YkD/+tEZeMRiOpYh+PjvaiTnrIrpyhnu9G1zSL2xP3mUM
 D3KYmuiJVuOYYQDklt81kKzUUfg1D2SSqehFGgllpPj5Sw7h0tqUkTOYiEYDhee7rqn4Kc9IEbK
 t9nNBlU8c9LP4tr1n2qiMylt3RZ1zCSz65dqkMT8/TfCP02PAR7nlYQ+osw==
X-Gm-Gg: AYBFou36v1U/4/gTI3bq/i7N7+qEXZL4NahxGk6Aj1K1WNMAEC9EfshX7RrwsFCMdUp
 ikiu7vUv6Jc7/X+E1dWT6GIhFwhafSGL+llP/d/JMlw6ZZ8urqC7gc9chilxgNfwQi4coYhmIiH
 VH9nuRz0s8nCDYu2lGFWIWRe/L3Cjqmmw1eJ2i6GWmUwhoNppuxPXtpQD7sFLFLOGIIwxKaC7iL
 rF0yz5XBUnEpYy4Rt9RVcLMbyVUZ9LNz3d2ijPFoKrv8Rt3jlygUfuI6uHZ+TRN/D8vDsZq5aSt
 ZmIZpX4hBXRon8IKbPZSoEawgsZQ2QkZsdMT560Jpbwg3v6RG2cRUYvrC/8+NixzQ/vxmJDh6/k
 O1BH/OIDNP9rtgJp540uODDMYM4T7UPCJBM4=
X-Received: by 2002:a05:690c:d94:b0:85b:f1ba:ade2 with SMTP id
 00721157ae682-87c02b226a0mr1553247b3.0.1788782940724; 
 Mon, 07 Sep 2026 05:09:00 -0700 (PDT)
X-Received: by 2002:a05:690c:d94:b0:85b:f1ba:ade2 with SMTP id
 00721157ae682-87c02b226a0mr1552997b3.0.1788782940287; 
 Mon, 07 Sep 2026 05:09:00 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8714b720d82sm70974857b3.41.2026.09.07.05.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 05:08:59 -0700 (PDT)
Message-ID: <f76b09f2-3835-471e-9638-b8a826d000b0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:08:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Set vtype before whole-register vector moves
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260903170011.3627720-1-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260903170011.3627720-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea95d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=Uuzr4GicECs_swJ96S0A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: eBHwXK1QqCxnbkZVUZpmLh-rwIfD4gyc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX0DxMZ4s0aNQ3
 fpu9N1jSCzgsT7u+L2/N0OGEg+stRmx97SKQpqrbuDWW9GuMUMCekSeJGJErj4bGq0AZuZx4UZR
 aa6uXDlwwW5KMn7O9RvXZdeLKGOHWb4=
X-Proofpoint-GUID: eBHwXK1QqCxnbkZVUZpmLh-rwIfD4gyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX+u9jXTSWPR5A
 CQMk8b1NaRdJSTF1nMGyLWh6e03rqXwiKZjfkyRZ08ctNCLgil9TAjBXLFnVGtn6PJaAXlz7yIj
 /mh7YmTXos2OaRdyYa8r8QPsi/T8Bm/Wg0/5/SP+jJuonODOaUjekh6rjmfBRzHsfhg4xHPCIhk
 CaXTxfS5bO28fiYxCcPznwP1Bg3kQAT0PvBXxDoyn/JKa/LuKQv6FO4zcMTjfPd6srdE5sOzEaP
 XSIvkxRWM30FiiUyAwhPkD9Hc1pUX7hL/Yh2N609oOmzjOGgeSXhOJsG/BfDTP5b7SUG4ViLcq9
 NgD0+PvbkeqCfDzdWqti1CykeQO602CqiQDLoyYZeC11pSXzHjadMsn9QDhmeHShM3g6TPQQ0hH
 XOzMk/KsV2HUANK0pG8cOdby+wE7/KuZwUyGNLe02Ids/37nuMamNVQGwE02byul56Uzqgs59gx
 Ie5KNC/aamfu2KIalGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 9/3/2026 2:00 PM, Max Chou wrote:
> According to the RISC-V unpriviledge spec,
>    "vset{i}vl{i} and whole register loads and stores do not depend upon
>     vtype."
> The whole-register vector move instructions reuqire legal vtype that
> trap when VILL is set.
> 
> The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
> OPC_VMVNR_V.
> 
> Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tcg/riscv64/tcg-target.c.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
> index 2ce9d47a633..fbfb4c44470 100644
> --- a/tcg/riscv64/tcg-target.c.inc
> +++ b/tcg/riscv64/tcg-target.c.inc
> @@ -778,6 +778,8 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>           {
>               int lmul = type - riscv_lg2_vlenb;
>               int nf = 1 << MAX(lmul, 0);
> +
> +            set_vtype_len(s, type);
>               tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
>           }
>           break;


