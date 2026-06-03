Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA6CD6E64
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUiI8-0002w2-QO; Wed, 03 Jun 2026 05:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wUiI6-0002vp-WD
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 05:53:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wUiI3-0000ng-Bd
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 05:53:38 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6536RI8d1200075
 for <qemu-riscv@nongnu.org>; Wed, 3 Jun 2026 09:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KpgpF7A16AAQFzB9hYeS2UN2mJRYNAL4rsBg1DNRLk4=; b=c7NKmB1HwYR/9o8S
 89B+PgN+cLxpxm8/nFJhkZMFyrdPe2p4wwld3P2lxOpSStKb294XoIoKtaWlHUFU
 IBZdYXtkk8AMurBEML6b42NBiWGOWIP+2BaInZ+vPZ1ErkEDZYYzxJEy3TtYPx8r
 i0TMfMQYlF6gOmr8WzKZnnKSzC6FRputO005aIUANrYArSTT0tvHFw/CkOlZHpWU
 PgcMJGZLeqYzUBMQapRTNIcESOqoipygsYELdzsG/6cGgrcuwRvmKdl1gZRzpKha
 yQQ90iibUHAFp0HeWfH6javRDwg4t9KWtDR/HgrzmxR0RB0XHYhCWKBLYsANJbET
 QJbLMQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1dj1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 03 Jun 2026 09:53:33 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66073c7c2f1so5868040d50.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jun 2026 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780480413; x=1781085213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpgpF7A16AAQFzB9hYeS2UN2mJRYNAL4rsBg1DNRLk4=;
 b=dv7O31KV4UeFUDfcLNkfpc7rYlfNDJjrpGKhrSQbxL0FZD3y9SIeNFiIX1pMEh4Xt4
 kLXt4ENxDYMRLpRW8zKLuvRIHXz3YT6C6QfVWx/FBFwrEHzrxrHbQ3FfjA2UJdWVgXgu
 t/p6i9wcZsRPb3N7EONWqpjhc7t5hVt72TFeAAXVA3XSrFq9SL+4l85tyzURmskko/vV
 97pPkHKsw6dlAcZTLP1ku65GFR7+rkgdL7rFlFSDSjt3fzxYomO1MBkzKUTyq6dWEcbb
 j8tA92T2Lu01s7s92Ute0XY80dntp33k+eVQEOqyhMsfp7amfck8aDfOJcYqm1OKycFm
 4TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780480413; x=1781085213;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KpgpF7A16AAQFzB9hYeS2UN2mJRYNAL4rsBg1DNRLk4=;
 b=kX0a0To+443H/G42+7kpzg16TxYKrTUDHXz8BoFrnMwU6Tc7MTpKJsbrGW8shzW0Sh
 7WQ3WowGK6ctuAiDyU74fMXk/Unpzm1I+BhqoREG9q68GC/JUL6KCt7wLKyEYUeLshjs
 4hG0O0xoQwMVLJ2lXt48jw/FeIO3vWmwnyOY67XFNcWufOCSvC879UHdCDExYjZU0LLi
 lhIQ0JsK1Mj+F3f2C08VPzGERmUymKz6lgbkuyymPEYxYyZr9buC8ioSm5RgcFq66HaI
 buZncO4KOzED1hV96c6Ff5d2Lj/fFsHVw6KnDUo7P8J8ZzmCFl80mAMjCZp2ZTBj62g5
 cQ+w==
X-Gm-Message-State: AOJu0YzViqpxE041r642OWhd03KOCZc2Tdi8VuwCEuWkeXb7IqysfjXa
 AL7CmlY2yLYSrkO45TX/ELyJIJ8PABwpp1I6LnG+p4O8FAPxKl+G3tE0NCPUXgJLE7oED3UJnhM
 gKSy20siK23OwimFUAIPCvApiMb7yHzzQADsmp4rp8nKSj7LBL1gtiSGUWg==
X-Gm-Gg: Acq92OGqsZjoS2BCCSNRc6Q+eodkqtBIl4DcrcB2OjRyDtND4QFSV2Z/431qeCod1Hj
 vfj1qLJI8wZGaQoENhBp0YhiUs1D+bq4EyfXJrvJsfRAktt+VrDTnAMpu5EHe5uWnXxFydZv2TU
 FyJ8AYq0COFs4O2DiyrOoCQp79v3+PUiVUnzDJ/F2CdAMo9mlcj9hv5RfQ6fPUQEixpPfPtEWaH
 A025e+lBeGBoxFbflGIAxTQgdtCc5YmfMxlHwy8XQfVr/yIYf6I6P2Wz/A3GHGhceWLaHLTDAYk
 RlSfIezT3JPJRWlXk21vzY+kkEQBX/mzPDI7JHOH2U9wzQZLMhve5euiNDGM2cRgFWuxU9E/vFs
 /VxhDUOfi/sPBPtQ6tifDS4gXe51vmh31Dod2PV4ukzy1WW49ZYni1DL61lFMhTEEzpjW
X-Received: by 2002:a05:690c:b10:b0:7dc:1d92:180a with SMTP id
 00721157ae682-7ea4db5d23emr23185057b3.50.1780480412846; 
 Wed, 03 Jun 2026 02:53:32 -0700 (PDT)
X-Received: by 2002:a05:690c:b10:b0:7dc:1d92:180a with SMTP id
 00721157ae682-7ea4db5d23emr23184897b3.50.1780480412360; 
 Wed, 03 Jun 2026 02:53:32 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea23b9b4d7sm13013607b3.42.2026.06.03.02.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:53:31 -0700 (PDT)
Message-ID: <6633f78c-2291-4f6e-9ef0-9d3198cd30a6@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 06:53:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/27] target/riscv: Fix arguments to board IMSIC
 emulation callbacks
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 alistair.francis@wdc.com
References: <20260520125406.28693-1-anjo@rev.ng>
 <20260520125406.28693-16-anjo@rev.ng>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260520125406.28693-16-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DDGll-I54MTKvM2IubRUiTshnsHAY60-
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1ff99d cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=JF9118EUAAAA:8 a=nrPx4w6NPzF0ZZKuB-IA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NCBTYWx0ZWRfX6v/xqF1rrS+V
 8KAqTaVqSKSy1fvt5QcTvBuWA+zvIcRyJMjhwWlu0bR8OYunUzSwpBOTZfcCzIiUACDpiYTkZIM
 wWGYxacBy0/NDAZnfTudBa/KvY4UPMGhvTbkSjylX5r5dCp1yHzr+okUYEMl/PoWwVZhq+w4+tZ
 GLdWaEg571j9z0F6NPUBtLXhgQnf/QtW1YVWqsP4g5Qi7t4sCHJimjDD3AOqRpjalewsqTm2er+
 nSDwT6MLjI8ix0nC+2c8ALlvQVwgYwGWWMtl/f4QZcfjyqOjM7+xqNTt+sY/zb6jcmynkeeMh6E
 rA0GkznbQkwvPGxfQ2Ybl/alHa9oD+ZACcdnqaLSmxWvCK+NAxE8XMEklqJshBQJPtgNv2dxDQC
 trCBPjBdhuFs7+bLGsqIZKQYbuZaHS/lQXi0YpaAECTwSN+y2dZGnsEFAIBDsqz28tbaPE2ygnp
 A83YHEAXjXTyrqD2xjg==
X-Proofpoint-GUID: DDGll-I54MTKvM2IubRUiTshnsHAY60-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030094
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi,

This patch is causing a seg fault in rmw_xireg_aia():


$ gdb --args ./build/qemu-system-riscv64 -M riscv-server-ref --nographic


(gdb) bt
#0  0x0000aaaaab3bda20 in rmw_xireg_aia
     (env=0xaaaaac194d80, csrno=849, isel=114, val=0x0, new_val=0, wr_mask=18446744073709551615)
     at ../target/riscv/csr.c:2735
#1  0x0000aaaaab3be320 in rmw_xireg (env=0xaaaaac194d80, csrno=849, val=0x0, new_val=0, wr_mask=18446744073709551615)
     at ../target/riscv/csr.c:2950
#2  0x0000aaaaab3c5628 in riscv_csrrw_do64
     (env=0xaaaaac194d80, csrno=849, ret_value=0x0, new_value=0, write_mask=18446744073709551615, ra=281472560986724)
     at ../target/riscv/csr.c:5813
#3  0x0000aaaaab3c5884 in riscv_csrrw
     (env=0xaaaaac194d80, csrno=849, ret_value=0x0, new_value=0, write_mask=18446744073709551615, ra=281472560986724)
     at ../target/riscv/csr.c:5871
#4  0x0000aaaaab3cb670 in helper_csrw (env=0xaaaaac194d80, csr=849, src=0) at ../target/riscv/op_helper.c:75


Down there:



On 5/20/2026 9:53 AM, Anton Johansson via qemu development wrote:
> In hw/ the relevant RISCVIMSICState fields
> eidelivery, eithreshold, eistate are uint32_t.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h        | 42 ++++++++++++++++++++-------------------
>   hw/intc/riscv_imsic.c     | 34 +++++++++++++++----------------
>   target/riscv/cpu_helper.c | 12 ++++-------
>   target/riscv/csr.c        | 24 ++++++++++++----------
>   4 files changed, 57 insertions(+), 55 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 10afc617f8..9823d7d581 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -200,6 +200,24 @@ FIELD(VTYPE, VMA, 7, 1)
>   FIELD(VTYPE, ALTFMT, 8, 1)
>   FIELD(VTYPE, RESERVED, 9, sizeof(uint64_t) * 8 - 10)
>   
> +#ifndef CONFIG_USER_ONLY
> +/* machine specific AIA ireg read-modify-write callback */
> +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen)                 \
> +    ((uint32_t)((((__xlen) & 0xff) << 24) |                                    \
> +                (((__vgein) & 0x3f) << 20) |                                   \
> +                (((__virt) & 0x1) << 18) |                                     \
> +                (((__priv) & 0x3) << 16) |                                     \
> +                  (__isel & 0xffff)))
> +#define AIA_IREG_ISEL(__ireg) ((__ireg) & 0xffff)
> +#define AIA_IREG_PRIV(__ireg) (((__ireg) >> 16) & 0x3)
> +#define AIA_IREG_VIRT(__ireg) (((__ireg) >> 18) & 0x1)
> +#define AIA_IREG_VGEIN(__ireg) (((__ireg) >> 20) & 0x3f)
> +#define AIA_IREG_XLEN(__ireg) (((__ireg) >> 24) & 0xff)
> +
> +typedef int (*aia_ireg_rmw_fn)(void *arg, uint32_t reg, uint64_t *val,
> +                               uint64_t new_val, uint64_t write_mask);
> +#endif
> +
>   typedef struct PMUCTRState {
>       /* Current value of a counter */
>       uint64_t mhpmcounter_val;
> @@ -465,20 +483,8 @@ struct CPUArchState {
>       void *rdtime_fn_arg;
>   
>       /* machine specific AIA ireg read-modify-write callback */
> -#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> -    ((((__xlen) & 0xff) << 24) | \
> -     (((__vgein) & 0x3f) << 20) | \
> -     (((__virt) & 0x1) << 18) | \
> -     (((__priv) & 0x3) << 16) | \
> -     (__isel & 0xffff))
> -#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> -#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> -#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
> -#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
> -#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
> -    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> -        target_ulong *val, target_ulong new_val, target_ulong write_mask);
> -    void *aia_ireg_rmw_fn_arg[4];
> +    aia_ireg_rmw_fn aia_ireg_rmw_cb[4];
> +    void *aia_ireg_rmw_cb_arg[4];
>   
>       /* True if in debugger mode.  */
>       bool debugger;
> @@ -646,12 +652,8 @@ void riscv_cpu_interrupt(CPURISCVState *env);
>   #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                                void *arg);
> -void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, privilege_mode_t priv,
> -                                   int (*rmw_fn)(void *arg,
> -                                                 target_ulong reg,
> -                                                 target_ulong *val,
> -                                                 target_ulong new_val,
> -                                                 target_ulong write_mask),
> +void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
> +                                   aia_ireg_rmw_fn rmw_fn,
>                                      void *rmw_fn_arg);
>   
>   RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 7c9a012033..3ce9f146c0 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -88,11 +88,11 @@ static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
>   }
>   
>   static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t page,
> -                                      target_ulong *val,
> -                                      target_ulong new_val,
> -                                      target_ulong wr_mask)
> +                                      uint64_t *val,
> +                                      uint64_t new_val,
> +                                      uint64_t wr_mask)
>   {
> -    target_ulong old_val = imsic->eidelivery[page];
> +    uint32_t old_val = imsic->eidelivery[page];
>   
>       if (val) {
>           *val = old_val;
> @@ -106,11 +106,11 @@ static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t page,
>   }
>   
>   static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t page,
> -                                      target_ulong *val,
> -                                      target_ulong new_val,
> -                                      target_ulong wr_mask)
> +                                      uint64_t *val,
> +                                      uint64_t new_val,
> +                                      uint64_t wr_mask)
>   {
> -    target_ulong old_val = imsic->eithreshold[page];
> +    uint32_t old_val = imsic->eithreshold[page];
>   
>       if (val) {
>           *val = old_val;
> @@ -124,8 +124,8 @@ static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t page,
>   }
>   
>   static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
> -                                 target_ulong *val, target_ulong new_val,
> -                                 target_ulong wr_mask)
> +                                 uint64_t *val, uint64_t new_val,
> +                                 uint64_t wr_mask)
>   {
>       uint32_t base, topei = riscv_imsic_topei(imsic, page);
>   
> @@ -149,11 +149,11 @@ static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
>   
>   static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
>                                  uint32_t xlen, uint32_t page,
> -                               uint32_t num, bool pend, target_ulong *val,
> -                               target_ulong new_val, target_ulong wr_mask)
> +                               uint32_t num, bool pend, uint64_t *val,
> +                               uint64_t new_val, uint64_t wr_mask)
>   {
>       uint32_t i, base, prev;
> -    target_ulong mask;
> +    uint64_t mask;
>       uint32_t state = (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_ENABLED;
>   
>       if (xlen != 32) {
> @@ -178,7 +178,7 @@ static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
>               continue;
>           }
>   
> -        mask = (target_ulong)1 << i;
> +        mask = 1ull << i;
>           if (wr_mask & mask) {
>               if (new_val & mask) {
>                   prev = qatomic_fetch_or(&imsic->eistate[base + i], state);
> @@ -197,8 +197,8 @@ static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
>       return 0;
>   }
>   
> -static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *val,
> -                           target_ulong new_val, target_ulong wr_mask)
> +static int riscv_imsic_rmw(void *arg, uint32_t reg, uint64_t *val,
> +                           uint64_t new_val, uint64_t wr_mask)
>   {
>       RISCVIMSICState *imsic = arg;
>       uint32_t isel, priv, virt, vgein, xlen, page;
> @@ -383,7 +383,7 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>           }
>   
>           if (!kvm_irqchip_in_kernel()) {
> -            riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
> +            riscv_cpu_set_aia_ireg_rmw_cb(env, (imsic->mmode) ? PRV_M : PRV_S,
>                                             riscv_imsic_rmw, imsic);
>           }
>       }
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7c0ff49d0..90c126fdc2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -816,17 +816,13 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>       env->rdtime_fn_arg = arg;
>   }
>   
> -void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, privilege_mode_t priv,
> -                                   int (*rmw_fn)(void *arg,
> -                                                 target_ulong reg,
> -                                                 target_ulong *val,
> -                                                 target_ulong new_val,
> -                                                 target_ulong write_mask),
> +void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
> +                                   aia_ireg_rmw_fn rmw_fn,
>                                      void *rmw_fn_arg)
>   {
>       if (priv <= PRV_M) {
> -        env->aia_ireg_rmw_fn[priv] = rmw_fn;
> -        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
> +        env->aia_ireg_rmw_cb[priv] = rmw_fn;
> +        env->aia_ireg_rmw_cb_arg[priv] = rmw_fn_arg;
>       }
>   }
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4bab7ec29f..837212b55f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2655,6 +2655,7 @@ static RISCVException rmw_xireg_aia(CPURISCVState *env, int csrno,
>       uint8_t *iprio;
>       privilege_mode_t priv;
>       uint32_t vgein;
> +    uint64_t wide_val;
>   
>       /* VS-mode CSR number passed in has already been translated */
>       switch (csrno) {
> @@ -2699,16 +2700,17 @@ static RISCVException rmw_xireg_aia(CPURISCVState *env, int csrno,
>           }
>       } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
>           /* IMSIC registers only available when machine implements it. */
> -        if (env->aia_ireg_rmw_fn[priv]) {
> +        if (env->aia_ireg_rmw_cb[priv]) {
>               /* Selected guest interrupt file should not be zero */
>               if (virt && (!vgein || env->geilen < vgein)) {
>                   goto done;
>               }
>               /* Call machine specific IMSIC register emulation */
> -            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> +            ret = env->aia_ireg_rmw_cb[priv](env->aia_ireg_rmw_cb_arg[priv],
>                                       AIA_MAKE_IREG(isel, priv, virt, vgein,
>                                                     riscv_cpu_mxl_bits(env)),
> -                                    val, new_val, wr_mask);
> +                                    &wide_val, new_val, wr_mask);
> +            *val = wide_val;

Here.  We can't just do *val = wide_val because there's no guarantee that *val,
i.e. the 'ret_value' of riscv_csr_op_fn(), is not NULL:

typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
                                           target_ulong *ret_value,  <--------
                                           target_ulong new_value,
                                           target_ulong write_mask);

This fixes it:

    if (val) {
        *val = wide_val;
    }


Note that this is the same pattern used in other predicates.  E.g
rmw_xiselect() does:


     if (val) {
         *val = *iselect;
     }



rmw_xtopei down there needs the same:

>           }
>       } else {
>           isel_reserved = true;
> @@ -2941,6 +2943,7 @@ static RISCVException rmw_xtopei(CPURISCVState *env, int csrno,
>       int ret = -EINVAL;
>       privilege_mode_t priv;
>       uint32_t vgein;
> +    uint64_t wide_val;
>   
>       /* Translate CSR number for VS-mode */
>       csrno = aia_xlate_vs_csrno(env, csrno);
> @@ -2966,7 +2969,7 @@ static RISCVException rmw_xtopei(CPURISCVState *env, int csrno,
>       };
>   
>       /* IMSIC CSRs only available when machine implements IMSIC. */
> -    if (!env->aia_ireg_rmw_fn[priv]) {
> +    if (!env->aia_ireg_rmw_cb[priv]) {
>           goto done;
>       }
>   
> @@ -2979,10 +2982,11 @@ static RISCVException rmw_xtopei(CPURISCVState *env, int csrno,
>       }
>   
>       /* Call machine specific IMSIC register emulation for TOPEI */
> -    ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> +    ret = env->aia_ireg_rmw_cb[priv](env->aia_ireg_rmw_cb_arg[priv],
>                       AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein,
>                                     riscv_cpu_mxl_bits(env)),
> -                    val, new_val, wr_mask);
> +                    &wide_val, new_val, wr_mask);
> +    *val = wide_val;

This needs to be:

     if (val) {
         *val = wide_val;
     }



Thanks,
Daniel

>   
>   done:
>       if (ret) {
> @@ -4486,7 +4490,7 @@ static RISCVException read_vstopi(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
>       int irq, ret;
> -    target_ulong topei;
> +    uint64_t topei = 0;
>       uint64_t vseip, vsgein;
>       uint32_t iid, iprio, hviid, hviprio, gein;
>       uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
> @@ -4501,13 +4505,13 @@ static RISCVException read_vstopi(CPURISCVState *env, int csrno,
>           if (gein <= env->geilen && vseip) {
>               siid[scount] = IRQ_S_EXT;
>               siprio[scount] = IPRIO_MMAXIPRIO + 1;
> -            if (env->aia_ireg_rmw_fn[PRV_S]) {
> +            if (env->aia_ireg_rmw_cb[PRV_S]) {
>                   /*
>                    * Call machine specific IMSIC register emulation for
>                    * reading TOPEI.
>                    */
> -                ret = env->aia_ireg_rmw_fn[PRV_S](
> -                        env->aia_ireg_rmw_fn_arg[PRV_S],
> +                ret = env->aia_ireg_rmw_cb[PRV_S](
> +                        env->aia_ireg_rmw_cb_arg[PRV_S],
>                           AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,
>                                         riscv_cpu_mxl_bits(env)),
>                           &topei, 0, 0);


