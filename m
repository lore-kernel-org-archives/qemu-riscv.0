Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33990C44515
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 18:25:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkQle-0001L9-9w; Thu, 16 Jul 2026 14:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkQlc-0001Ka-AG
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:25:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkQla-0004Wx-Ab
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:25:04 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GHZd6w3281003
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KIOst/QVY/uMwNwrWmJdwqpr5OV9vYaDLLOs+fIzpdQ=; b=ffJ8CPYPxPW3W2Rv
 yqqOptf3XIe80RsyW3lRf9r3jlpOeXeJfPScXwiwQFSSiUhdnlXg82V94NKVA4W4
 mEI0dcSgei9d99RtdRUzXeq8PAZZl6Vcer0agHMZ3q8GV5zDzMbGMfozQGdzzz8g
 sXezWKxeMx9wmWlmf1OgDPYkgyEJXtBXXboYatn78pyJZdCQV3f990CNo4cS3f/b
 2ZvmSNABwytQBezmGiuNIO8af1oklx/RQc+0d/oYS3n4FWTDAcZspALVkcyMlDcT
 GQgbpBVlciW5jS0du3JvtCgeLU6V85oIEHo5bTOLD2UrHggJhuxUdMHMFcgxR1KL
 JGvWzA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8g65g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:25:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f0f45415cfso68974626d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784226299; x=1784831099; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KIOst/QVY/uMwNwrWmJdwqpr5OV9vYaDLLOs+fIzpdQ=;
 b=U6CNB1vK/wK+8VUQOw0BZkmtackZ6yhDX121QURzS2orhQy9F3S1RBlhOijHD4PRRu
 ZCb9E52FYiHC1dl28Ue7qkDxz1KWRPhYTRxtVO1BGTPF2VlC/tiieAqTZuxn+sHHrRxy
 bC/AbyY1xZcmXq62x51URz6h4QQ4p/Xq6CTxM3MY5mrW7GIuW7tTOGYEOKtinbmX/VBv
 84xomqnSveiTrz9h/IDRuEtqVpwHfF0Fr0qiwLX4Bzxd1hqL9ai6Aw7pX9fv1bfJacYj
 bQOgki/U+sB0lF1+y9mRBp0/wXbiaJNfEII951YDCQDInbONhom8Fs2UAN1tG+GDXCA9
 0Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784226299; x=1784831099;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KIOst/QVY/uMwNwrWmJdwqpr5OV9vYaDLLOs+fIzpdQ=;
 b=p83YJ5C/GVSnmakIvQE+fqT0zWayQ/j2cpLJbGQXOrlRhbzQwY2vxBwr5FBG6HZ/CA
 /r1YIIFAdDG1QX/uX7Fo6+6gmCsAUcRUtTgV5QVgRVo2O7eUdIQQuiVlyzbHrekEtQq3
 w65chrZ2bwULINkaHlbPZ3tXlM+Vjo7bnIWS29y6v4OmWhGL+pedBUP5iDTSVe0TeNLF
 tWDwunHYGki5q0coHewdFZe3s8Cx0vzK3p/r3k2iIDbBWBikMtoZ43rvwCgge6NP4KOB
 dTqnEyeNpf9tI8VhXSAPfjrAZi7f1yymMYIr8IFaLP68G8DXsYuQ5fePd/UmgI8Dm1VE
 zI0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5GhZDSHpzgTdDL+gnR0+7/tCOScJcWm/G9DWqyV0S0Svj+mmcJLl/by8dcqKQHDrR7QtWBudOakWp@nongnu.org
X-Gm-Message-State: AOJu0YzeoEyCoobZx/hm0pgbu1YGs0ZChY0jDhqT2pCgnltV5W+kWIPM
 mwYPHpgREoszllvJMqKysV1JUiRCQaolkagy2iJ+wT1XbaHL2I0YNRjoPTvL5TH/ih6SOYaj0fD
 9GodZpqlkqApr9K0caXT7yLhjGxEKnlIMT3ASx8LLMKIelM7iGpAyY8xiLg==
X-Gm-Gg: AfdE7cnIBwq+mq8lRmyUk7Y0ysBzudbFohAJNa4RIRvLKqk2D+DV2mC/MlVAsoCdEQK
 9PoUk1R7sYAehmVwrHEEBHzu8QenxCNddX61foNpK5qYtquDrwRccF2q9Dt/EDGjXujDIU/Of4L
 Bln2slXGIug+ZP/g5v4Yffv2y3JQ2rq+83hOlEFRBRnpgIsBkXLljyvVevjvhJ8yV3hckGWUKRq
 kbPJhaf2eJTzPJq/LY/zT+da6/0zykcKO0fSu6OdC33xBt9m+rpAExvzHpUXhtDEp4lpaUowAkv
 SgOUgLzbExRA9OJPp3NnuMYo6Cb/d0zMw1+/Mpb5cj4T9IxM/DJJL4otpka5xAwYiqzInXhoVKv
 uHuiUhvQGcCnfngFXYpaPZbClTTLfdpNl1fvhcw==
X-Received: by 2002:a05:620a:640a:b0:92e:529b:b802 with SMTP id
 af79cd13be357-930b0827c95mr63498585a.70.1784226299470; 
 Thu, 16 Jul 2026 11:24:59 -0700 (PDT)
X-Received: by 2002:a05:620a:640a:b0:92e:529b:b802 with SMTP id
 af79cd13be357-930b0827c95mr63493985a.70.1784226298806; 
 Thu, 16 Jul 2026 11:24:58 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.123.183])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd248e666sm223119276d6.0.2026.07.16.11.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 11:24:58 -0700 (PDT)
Message-ID: <ba4ea9a1-dd4d-4a96-aca5-1c14193420cb@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 15:24:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] disas/riscv.c: Correct indent for checkpatch
To: frederic.petrot@univ-grenoble-alpes.fr, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: julien.thillard@univ-grenoble-alpes.fr
References: <20260716154615.1545145-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20260716154615.1545145-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716154615.1545145-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PUz856prdrMSpI5VEuBuxt9OEppoyiQE
X-Proofpoint-ORIG-GUID: PUz856prdrMSpI5VEuBuxt9OEppoyiQE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX00Dxkre86Mv4
 qMNM1gzEDgwwldlo0gI1qqhRVXX6iqv+EguF8aAhuUemm5Tooap/MCbIu7bnRDlpm1p17p8Asey
 yrMPuj3xtW+MJwVpMwO0s78sa9dzsFw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX3jsS7fFchQJH
 uN0G2E2zpHgIuzBRqne8GZL7lPV8hbK5FoBAT7g5Flr6xs4onDZ6Fapxaolk7eER6PxiWXO6gTK
 h1NGigdan49nZ5JSugIuJ6WM80AjhH7zUiHh7sfPZfbX2/rs6L0xHaq1GIDyq9vTCSqiZCVDpeI
 zRJNotfaFaoeUZ26PlVuwj/MaYWtNmLJKokkA1KPcqIkpCoKfGhRUhtQ8/eWX86GtrInlSP11fR
 fWBUhUIN0aqmOJiSoq+UtaNVppZv2l9OgrUyieVUbTF9YP7z8A6uYvyxV9+sklBnpYdiiqdo9hv
 ejhatSQeKZANEuuZWeVqaY4+iqcjp87vM/Dk8+xqmpfjnoZiXc9jbdOtZbONPewiHJ4CPyNltSm
 IeAjV6iBtsqvlxWekaDYoc/bs3TUhhG1eCi7gUu0COwr6roE1wHNuOYUXo9bqUAQHlLjQZiMKjS
 gG/Mqdo0f7JGzhhaCWQ==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5921fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=szoPuAicwqWYzOEwwuIrwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9Zw2DNSAMAMWkiGVaAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160189
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/16/2026 12:46 PM, frederic.petrot@univ-grenoble-alpes.fr wrote:
> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
> Trival indentation patch on the cbo/lq relevant code, in preparation

s/Trival/Trivial


> for modifications in that part.
> 


Fixes: 9273cda722 ("disas/riscv.c: add 'cbo' insns to disassembler")

> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



If no more changes are need I believe the maintainer can fixup the typo before
queuing. No need to send a v3 because of it.


Cheers,
Daniel




>   disas/riscv.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7f1b262773..689502f083 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2887,25 +2887,25 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 0: op = rv_op_fence; break;
>               case 1: op = rv_op_fence_i; break;
>               case 2:
> -               /*
> -                * 'lq' shares the "(...) 010 ..... 0001111" opcode space
> -                * with 'cbo' insns.  Check the next 5 bits to select
> -                * what we want:
> -                *
> -                * cbo_inval  0000000 00000 ..... 010 00000 0001111
> -                * cbo_clean  0000000 00001 ..... 010 00000 0001111
> -                * cbo_flush  0000000 00010 ..... 010 00000 0001111
> -                * cbo_zero   0000000 00100 ..... 010 00000 0001111
> -                *
> -                * Anything that doesn't match these will default to 'lq'.
> -                */
> -               switch ((inst >> 17) & 0b11111) {
> -               case 0: op = rv_op_cbo_inval; break;
> -               case 1: op = rv_op_cbo_clean; break;
> -               case 2: op = rv_op_cbo_flush; break;
> -               case 4: op = rv_op_cbo_zero; break;
> -               default: op = rv_op_lq; break;
> -               }
> +                /*
> +                 * 'lq' shares the "(...) 010 ..... 0001111" opcode space
> +                 * with 'cbo' insns.  Check the next 5 bits to select
> +                 * what we want:
> +                 *
> +                 * cbo_inval  0000000 00000 ..... 010 00000 0001111
> +                 * cbo_clean  0000000 00001 ..... 010 00000 0001111
> +                 * cbo_flush  0000000 00010 ..... 010 00000 0001111
> +                 * cbo_zero   0000000 00100 ..... 010 00000 0001111
> +                 *
> +                 * Anything that doesn't match these will default to 'lq'.
> +                 */
> +                switch ((inst >> 17) & 0b11111) {
> +                case 0: op = rv_op_cbo_inval; break;
> +                case 1: op = rv_op_cbo_clean; break;
> +                case 2: op = rv_op_cbo_flush; break;
> +                case 4: op = rv_op_cbo_zero; break;
> +                default: op = rv_op_lq; break;
> +                }
>               }
>               break;
>           case 4:


