Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1B8CA6004
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEduc-0008Iw-Vk; Wed, 07 Oct 2026 22:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEduG-0008Ho-Ki
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:30:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEduE-0000Ik-HZ
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:30:52 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6981hcb62575225
 for <qemu-riscv@nongnu.org>; Thu, 8 Oct 2026 02:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dkPt4b9RC9E93J7DjrdNx/7Q8tjA4QC9e1gV6qNF9Cs=; b=KN0S3zqNJVjo5m6N
 rVZF0AFAo2ccTwDH3Dgn5au6EABCmnGb9wqXPHdNZoLvZf4tg9HT9BjFY+pqx0qh
 PA+kHpkuL77GdHJ9inj0yFQp2ZuEaXrWqo6LqofdDzqOLmUxPeltj4MYdPsCfOkN
 iQYBGsskm2TYG1MzU56pa1ov/o9Lm+JNSTBaWPelgej7vLbz46pinzblk2ekxcpJ
 2EEJociBNfXijEelfPteOPbW0wwYW9twYZaZtP0kOqHzGr4DUjChtjBUcSP7ziYF
 ULpoFaEIS9q+NXUzkaTeqTUKlXpldjsMMPx0V24bql4wDgRhO4Pv4mUgs4GCBe1q
 Zp7+YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8a3u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2026 02:30:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934956beec8so1026843785a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791426645; x=1792031445; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dkPt4b9RC9E93J7DjrdNx/7Q8tjA4QC9e1gV6qNF9Cs=;
 b=VR31NBc8+EYxfe2g/HRUdYEr8Dly0OOP4dHQStxAjDykfcTDjJoSC8mZXBLylv7VUf
 tgzCQp19b/ktNvt0/OSgAxcTwpqucAndxs9WT/GpbiUkn9EvPEjTQobw7tsg8UKqEWm6
 IGut7tFYtT/WKRkMd4aN+5Tje+hEwl0Js+zf+40qU2Jgic+J2NQw6GqP/2GdJQw437J3
 suPA+dhTDroN5zZfXq7eiPRnsgespn6bkIO7t5UYBYP7b//vQ58M4oi+AWSGaG0JVkQs
 wH67IHXX9eXNidZ3i+oDIoblbbhPeeCXXGK8fAx9B3maKbjecUTkEesYJu1cIZttRB1n
 HljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791426645; x=1792031445;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dkPt4b9RC9E93J7DjrdNx/7Q8tjA4QC9e1gV6qNF9Cs=;
 b=wzfUJ73nMqJ3SHRe9kCb5oEOM/bmZluqHj21kLl2Tvy+KrvACY2W2nXG3jeIETdXlP
 0qjKCo/NZKy6BtcKCDM045s+faUeP4hDjuPAfVyhq0DmrpaBI5wRkYvKhAovtopDrTP0
 R3V4vgD4jqzARZ86F6x4SGWVAcytnzUREoIybfCd4bKy+vjMZ8qdALwhbuKdwFLSVrws
 +Dnt4WCGR/5kPm6g+RVgQn9uGV9eZxxrqrATEDS1nvWIT/i0tnuMjd9fH9GvrGPvXE4G
 ZAVFnmVtaVrWjmtx7wqKpllEHTybH6ZXihV4I3qGvzLGyWhbaGq9SeLPVfoikr4lJ9Hk
 JdOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzreoOMXQQZiRTazHOI7AmeNZ0xh0ScNTkLk0lvi5npgBrDOSe14NCxiuY0XGAwmq1XR0PPqJjSvtQ+@nongnu.org
X-Gm-Message-State: AFuF++koBiZyGDHP/uWS1f6bL4pia/kdsJLesew8BSmcbaC7RNb+K0rC
 d3qFgZtAOZeanIaoWVA1Qb8/9R0Scac/xD7taNgPV+TSlJrvd0I8czB0eZPvYfPrnz/RrC6JhrB
 HprlEIzJI4Lcn3VgXURXEKkhkpe9GBwwfjlr99W0qFe4OxA/em0qFFMUKWw==
X-Gm-Gg: AYBFou1jK4c/rn8QFnvusZXOI3i9CSsZP/e74MSZl8NS7A/HCOOYduF5NptaFGvHJjv
 F+gHFaajthnNnzrxpejcEJ2NjkFmhkH3OJfj4GRkB9obtzpOGBuHTOkD3noH8PsczP+bFjhDTWl
 PGNR4zuUzHh+1E6ZzRD9nci4U/HgvH5eNQTcI8CV+7NwzrTlQcGQB5CSxzJqALpq6HwNSYh6JcW
 n8b+2rMBz4WykBrpsgtc1hroBcsfVoXA5MV0wbuim0EACBtIB6EbUmDzecbjC4jyvjZjFugiGPw
 jlg6P1++dhQuDaJhyy4w2uQmO/z5JyMK6hD1tAqJR01AVKJIWqoI6nfwKSzh3UgU1zGi+bbNxUQ
 EDjwyiecpoYG9QzciwVm1I1Bon4VViaq7t+uP
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id
 af79cd13be357-93e9af3458dmr854003785a.0.1791426645426; 
 Wed, 07 Oct 2026 19:30:45 -0700 (PDT)
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id
 af79cd13be357-93e9af3458dmr854000085a.0.1791426644925; 
 Wed, 07 Oct 2026 19:30:44 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93e991eca24sm360692885a.39.2026.10.07.19.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 19:30:44 -0700 (PDT)
Message-ID: <9d481666-8d8e-43ae-b1c3-d5a9141d783f@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:30:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/11] target/riscv: Add smmpt-sdidlen property for the
 mmpt SDID field
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, chao.liu.zevorn@gmail.com,
 liwei1518@gmail.com, qemu-riscv@nongnu.org, rahul@summations.net,
 xiangyi.zeng@linux.alibaba.com, cxx194832@alibaba-inc.com
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
 <20260723200325.24969-3-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200325.24969-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cu0parNFWgMV9SD-TzFx02Pkf_2oTMyD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwOSBTYWx0ZWRfX0UzH/FGEzMtr
 8SL11aNa4WA2OXn0COvQzUlxCZqM05XxuHCebSRRopABKRT3+rlHzT/fqVSw1i3XEtSwTv0NQHo
 QhKrSjzO5BPofDnRGYTom9kl1vAov0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwOSBTYWx0ZWRfX3CXY31rTeM7G
 sWgb2iZMXa/r8XMSz6D1kSOACGhUQFr1nfDxTxfBVuC5NmfydCKYMev7EEHbOusPcnGwRoBVlJZ
 b8kZWYQ7qiIyeaTBmA1zsNbC+9E2hiCvNy4K9r/gWBrv/SrPw64Ls8YV9Objy8MhIABeXg3cxRB
 DCiMNvZ1vx/Z5hegEZcP/uJq7sP68lesC9rV3WOuhhRWvPQIqNy0xxHdPtfTabCO+09hLbtBLga
 ASY2YtLFuYzZVfhX7jW+Yi3tmQ6ntdG72nG9D+FJXrNWhlLxTugpLjkT38Ne1fYTHTSn0jAbeMh
 cr2Xfj+jk40ZOv+NncC/9oHDIfJjyK+aomWpuX2l9FIDv+aUI+Fxrd3K3HDMqIgwv4vlEWfWCHc
 7xSQYxMiRzP7aHCtGLFgc87rcBbznMxYtTnTecSK+hsnjDrkEbnJ6+352N3aY10GJHHuq+KOCON
 7Skva9rUsmJHZTJuegA==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac70056 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SRrdq9N9AAAA:8 a=g7JV1MsSeyImncLccn4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Cu0parNFWgMV9SD-TzFx02Pkf_2oTMyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080009
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

Hi Zhiwei,

On 7/23/2026 5:03 PM, LIU Zhiwei wrote:
> The number of implemented SDID bits is UNSPECIFIED and may be zero. The
> number of implemented SDID bits, termed SDIDLEN, may be determined by
> writing one to every bit position in the SDID field, then reading back
> the value in mmpt to see which bit positions in the SDID field hold a
> one. The least-significant bits of SDID are implemented first: that is,
> if SDIDLEN > 0, SDID[SDIDLEN-1:0] is writable. The maximal value of
> SDIDLEN, termed SDIDMAX, is 6.
> 
> Model this by adding a configurable "smmpt-sdidlen" CPU property. The value
> defaults to SDIDMAX (6) to preserve the current behaviour. The mmpt write
> handler now keeps only the low SDIDLEN bits of the SDID field, making the
> SDIDLEN discovery sequence work as specified.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c                | 45 +++++++++++++++++++++++++++++++
>   target/riscv/cpu_bits.h           |  3 +++
>   target/riscv/cpu_cfg_fields.h.inc |  1 +
>   target/riscv/tcg/csr.c            | 11 ++++++--
>   4 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5a82e6563b..0f96e487fa 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1434,6 +1434,7 @@ static void riscv_cpu_init(Object *obj)
>       cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
>       cpu->cfg.vlenb = 128 >> 3;
>       cpu->cfg.elen = 64;
> +    cpu->cfg.sdidlen = MMPT_SDIDLEN_MAX;
>       cpu->cfg.cbom_blocksize = 64;
>       cpu->cfg.cbop_blocksize = 64;
>       cpu->cfg.cboz_blocksize = 64;
> @@ -1939,6 +1940,48 @@ static const PropertyInfo prop_vlen = {
>       .set = prop_vlen_set,
>   };
>   
> +static void prop_sdidlen_set(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint8_t value;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value > MMPT_SDIDLEN_MAX) {
> +        error_setg(errp, "smmpt-sdidlen must be between 0 and %d",
> +                   MMPT_SDIDLEN_MAX);
> +        return;
> +    }
> +
> +    if (value != cpu->cfg.sdidlen && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.sdidlen);
> +        return;
> +    }

This is something I'll eventually get to but I think we're being too protective
with vendor CPUs.  If users wants to use a vendor CPU and then change stuff that
would either misconfigure or mischaracterize it, we should just let them.  It's
a conscious decision in the command line to change the configuration of user
CPUs, i.e. users that do that are liable to any consequences too.


All this to say that we should get rid of this particular check.  Everything
else LGTM.


Thanks,
Daniel

> +
> +    cpu_option_add_user_setting(cpu, name);
> +    cpu->cfg.sdidlen = value;
> +}
> +
> +static void prop_sdidlen_get(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    uint8_t value = RISCV_CPU(obj)->cfg.sdidlen;
> +
> +    visit_type_uint8(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_sdidlen = {
> +    .type = "uint8",
> +    .description = "smmpt-sdidlen",
> +    .get = prop_sdidlen_get,
> +    .set = prop_sdidlen_set,
> +};
> +
>   static void prop_elen_set(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
> @@ -2853,6 +2896,8 @@ static const Property riscv_cpu_properties[] = {
>       {.name = "vlen", .info = &prop_vlen},
>       {.name = "elen", .info = &prop_elen},
>   
> +    {.name = "smmpt-sdidlen", .info = &prop_sdidlen},
> +
>       {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
>       {.name = "cbop_blocksize", .info = &prop_cbop_blksize},
>       {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4ed4843e3d..642edf3369 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -1171,6 +1171,9 @@ typedef enum CTRType {
>   #define CSR_MMPT        0x382
>   #define CSR_MSDCFG      0x74E
>   
> +/* Maximal number of implemented SDID bits (SDIDMAX) */
> +#define MMPT_SDIDLEN_MAX    6
> +
>   /*
>    * MMPT register layout for MXLEN=32:
>    * MODE[31:30], 0[29:28], SDID[27:22], PPN[21:0]
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 6b616388be..4a8c9b9e21 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -174,6 +174,7 @@ TYPED_FIELD(uint64_t, mimpid, 0)
>   TYPED_FIELD(uint32_t, pmu_mask, 0)
>   TYPED_FIELD(uint16_t, vlenb, 0)
>   TYPED_FIELD(uint16_t, elen, 0)
> +TYPED_FIELD(uint8_t,  sdidlen, 0)
>   TYPED_FIELD(uint16_t, cbom_blocksize, 0)
>   TYPED_FIELD(uint16_t, cbop_blocksize, 0)
>   TYPED_FIELD(uint16_t, cboz_blocksize, 0)
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 8ffe85caa9..8d38d7a972 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -5608,6 +5608,11 @@ static RISCVException write_mmpt(CPURISCVState *env, int csrno,
>                                    target_ulong val, uintptr_t ra)
>   {
>       uint32_t mode_value = 0;
> +    /*
> +     * Only the least-significant SDIDLEN bits of the SDID field are
> +     * writable; the remaining bits are WARL and read as zero.
> +     */
> +    uint64_t sdid_mask = MAKE_64BIT_MASK(0, riscv_cpu_cfg(env)->sdidlen);
>       if (!riscv_cpu_cfg(env)->ext_smmpt) {
>           goto set_remaining_fields_zero;
>       }
> @@ -5621,7 +5626,8 @@ static RISCVException write_mmpt(CPURISCVState *env, int csrno,
>               /* Only write the legal value */
>               env->mptmode = mode_value;
>           }
> -        env->sdid = (val & MMPT_SDID_MASK_32) >> MMPT_SDID_SHIFT_32;
> +        env->sdid = ((val & MMPT_SDID_MASK_32) >> MMPT_SDID_SHIFT_32)
> +                    & sdid_mask;
>           env->mptppn = val & MMPT_PPN_MASK_32;
>       } else if (riscv_cpu_xlen(env) == 64) {
>           mode_value = (val & MMPT_MODE_MASK_64) >> MMPT_MODE_SHIFT_64;
> @@ -5632,7 +5638,8 @@ static RISCVException write_mmpt(CPURISCVState *env, int csrno,
>               mode_value += SMMPT43 - SMMPT34;
>               env->mptmode = mode_value;
>           }
> -        env->sdid = (val & MMPT_SDID_MASK_64) >> MMPT_SDID_SHIFT_64;
> +        env->sdid = (((uint64_t)val & MMPT_SDID_MASK_64) >> MMPT_SDID_SHIFT_64)
> +                    & sdid_mask;
>           env->mptppn = val & MMPT_PPN_MASK_64;
>           /* Smmpt64: root table PPN bits 2:0 must be zero (32KiB alignment) */
>           if (env->mptmode == SMMPT64) {


