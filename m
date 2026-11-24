Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E0606A329
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 19:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R5ftOFRg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbO7rQtf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVwb2-0006NQ-4x; Tue, 24 Nov 2026 14:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVwb0-0006N8-3B
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:54:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVwaw-0006jS-Mp
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 14:54:29 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOIXoxD365939
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4k40eMLFP0JVHUmT/kaNBJjvo2yV7/+iGNmMEB29lYg=; b=R5ftOFRgUKzaD8uQ
 gdKjqjonEsgV2RWhxGgVhQRC/4Asxd2a2UVMMws10lJYKyZzxENi7wfTX0x+bEF7
 3TFx4SwkHVQoEwA3GPQQ4+KUMSb9NSak7xF62cMVmPvQ6Bv0hVs7Meu3munZp9Fq
 ioPTQpK7qf6BxbiRs3tBEYtzyN1vX/vBEcCoyG0QydoC+PA042pXKtVXZ4szakLJ
 axbQmBwixTmdFA7BmPx5emlMBTn+EtMrN3nATpD/9jSxTg0rNo8u9TtFLfZ206F/
 XeANkVRjDitxb6XvxQWYegDr0q7BIgJW4mc6s3MGTGAj9Z9TIz8NTPaXyXUuLgex
 k4niwA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhbpk5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 19:54:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9213730b07eso84276696d6.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795550063; x=1796154863; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4k40eMLFP0JVHUmT/kaNBJjvo2yV7/+iGNmMEB29lYg=;
 b=UbO7rQtf+XkoJ9ZhkLvtvmYfxUQtlCv79qp3H5fZUIM1vuqRzQ2ijDCx5WVwqxgbg7
 JB1X1PgfPMUf7U2w8/ZdAZm4Xl8l6FwGmHj7DM86Eoyn+KyL+U4Cd25/jrSHjvr1aBZZ
 xahl5Gks6Pz0mIb98dnat/Evoo282Pi8dSjtKjIQjd6Fup/isPz29toByUnD/bf7Q7zK
 J37ULGZNiq5DK8+6cHEYgokMvn+T6tKpJbj1QEzLue3JYPg6JM+8QC5tS7VTcHQ7YfUn
 9jTe30Ro0Gdts5J/hIcoSoJHsQAQYD5cqy6c8uHhaDbTnOvnldEgZptqs1RXql141M4A
 OnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795550063; x=1796154863;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4k40eMLFP0JVHUmT/kaNBJjvo2yV7/+iGNmMEB29lYg=;
 b=Qjg/+qUt8qqIvfjKnuYSiGa9UxfuZHpx8nAg5UPYeNSuCdLsXKwjj2FHg4pcvUfoJy
 h5JUOYrmHsC73kfnbALXkoBjeg7+gM42BprLGEpmsV1hl/l1M1PhS6QPDih139TmvqZM
 ELOWLjSBYxsM8xlhph3UD/Sq/AyN9HvWsMvIcn1Rgb2RS0b5c9bk1SnK9CoR266XSAc9
 FV0B6dQ3urzb0Qkqo1lK1oybDHLfpnGDtqQ4QfbCh98dXmq5Uwvps/sfbMTrg6+LnxWK
 YmxS1FkXLTPWbaEAF6rb7SzifyBiovTEviwxPrSoRV2R3M9pIO8kUdAMCVh7tu1Fw2Jm
 31Lw==
X-Forwarded-Encrypted: i=1;
 AL+hErFdi5NxIvPcWqZW62/bDXEUo8NrNhvFizu8wqeKl6hgM9SCKpWB3TXjh6UvSro5nZQlVtU3ygIAWeFs@nongnu.org
X-Gm-Message-State: APuU4Z+btRPdXq4PLrFELEljIEZQt/OmmPuS2mHevB63xb+YZuosfAmM
 g9FsiEtIiAk5Eexk9rCrzJR/WzeWHFmEKSScssWDAnz1wyqhRveCHUXh427ux4vDyAp8/v63qvW
 7/93GV9AvOsazEceHroU7IZA79tOffymKwAkPysyWnHjKyvuoiz4nF6N2OA==
X-Gm-Gg: AZFdTZfFT5VlsB6dhRgGTINNRuVCy6f9nj5ryzoQeb1Ibz8eOB4weGJdZPelRosDcIf
 AMT9PFlNurQ1vVJYYa8DzOx2tgjB5RXUa3RQRBO5c46qiuuGrxACo0zm4zE/4Xr+uKWAJHsvHFM
 HWpjzdPOtsbmfDcP509ow3RDJjZa0kUwiDMHhVtzs64u4zvgVdYvoNjXD4PIxKP175f1g8D3pl2
 IYuse1Cs65uVo+H2azMR+1iDpOMCrxUvHhmABTeu7tUgfoGr6H45z9Y4XqRv4ljN0BpjFuNA9JW
 n/i+ArKMkx4raS8DAgf78nYFpYuxpEpdsrG1xqvMp10jtIADoHDagCz14jo2TJ5mnA1isPzAqB+
 FCSG+fjMCmEz1p4U99FC0nE+Qymho2GvCIcBMWEVqe37V2Y5Hmd48rQPSDPODJmk/PKcL3xIVvu
 DwKhDo8y9C
X-Received: by 2002:a05:6214:5192:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-92134a61e86mr293558746d6.27.1795550062847; 
 Tue, 24 Nov 2026 11:54:22 -0800 (PST)
X-Received: by 2002:a05:6214:5192:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-92134a61e86mr293558226d6.27.1795550062370; 
 Tue, 24 Nov 2026 11:54:22 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a16754sm142249756d6.39.2026.11.24.11.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 11:54:21 -0800 (PST)
Message-ID: <78ece36f-df40-4763-9e73-c335f8810b47@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 16:54:18 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix mnepc alignment for Smrnmi
To: Samarth Sarda <samarthsarda@utexas.edu>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Dana Coates <elladana.coates@gmail.com>,
 Juliet Mathis <julietmathis2004@gmail.com>
References: <20261124182341.70418-1-samarthsarda@utexas.edu>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124182341.70418-1-samarthsarda@utexas.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05eb70 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=fFvnZ4lf4NxXG9ZHxLgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX925kh0ttvStg
 cRF/E0TENHz0wEJcUgKhY0gIwI3EF9pXWFOnsvDWfiM+JBNL3cH6gpx4pUYEwRPuIEI9oS+zwo5
 bPE+DtDEl3uHJzr3YR58md9tZC48L+I=
X-Proofpoint-GUID: SRBGL8JGxYyKL1Zn0bp8fgmJmlJA0Lah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3M6qi/W+g/1D
 V0m6NDFVEMwdJ3BBuI98ZHCt1P7LgoRlBf1IRrAj7NeB9WMZVtej4XK3ucVHjfBXSFh66F2WTTi
 9pT50ucd5n4aubkFlvWvNEB9NeJu0qVvPhXKwW4gl91r9FZ9JK/b60fVh9ayyVhin1FbFOiUmSj
 Jo95HhREDzr+bFBymTuGaVJUaEItoBcAWlZMxK35UDpUpDsJqFr8H05OcpB3XtiWtTgajteMimC
 zk7aLqYrIrRkmDPLhFvAG4kj/RvNnV1wTL36QrS/psgfUP76+JRVpwJNaP5hhIYPnowSQqm2BR+
 XYfIdJ7T4iwDLziRpqt5Y3+y4f5ntulBQ2dCNTru378XCpAtgKk/EFsS3BtxAZZy9RsY6miJ75z
 yHP78zNaMEBZdA+sCL6ol5OOKzrGz90rrjGQO3H5RN3UYjXrgdrD42u4gPCYBQN5K+NdDP0LzjM
 SDILz1o4cWMD0AamgWg==
X-Proofpoint-ORIG-GUID: SRBGL8JGxYyKL1Zn0bp8fgmJmlJA0Lah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On 11/24/2026 3:23 PM, Samarth Sarda wrote:
> When the RISC-V C extension is enabled, instructions may only need
> to be 16-bit aligned. Some RISC-V implementations allow software to
> dynamically enable/disable the extension through misa.C. That means
> IALIGN can change while the CPU is running. When switching between
> IALIGN=16 and IALIGN=32, bit 1 must be preserved when written, even
> when IALIGN=32. However, bit 1 must appear as zero when read under
> IALIGN=32. The same masking applies to the implicit read performed
> by MNRET.
> 
> Bit 1 of mnepc is being cleared permanently when IALIGN=32.
> 
> Our fix preserves bit 1 of mnepc if IALIGN is switchable
> regardless of the current IALIGN value.
> 
> Fixes: 5db557f82bff ("target/riscv: Add Smrnmi CSRs")
> Reported-by: David Harris

Reported-by uses the same format as Signed-off-by, i.e it needs an email too.

You should double check with Mr Harris about the email he would like to be
added here (I know he uses a harris@g.hmc.edu but I suggest double checking
with him).


> Signed-off-by: Samarth Sarda <samarthsarda@utexas.edu>
> Signed-off-by: Dana Coates <elladana.coates@gmail.com>
> Signed-off-by: Juliet Mathis <julietmathis2004@gmail.com>

I recognize Juliet.  We talked here:

https://gitlab.com/qemu-project/qemu/-/work_items/4825

And from the looks of it this patch is fixing that issue.  If that's the case,
please add a:

"Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4825"

tag in the commit msg too.  Note that since the gitlab bug was also reported
by David Harris, adding the "Resolves" and "Reported-by" is kind of redundant.
It's fine to keep both though ... as long as "Reported-by" is in the required
format as stated above.

> ---
>   target/riscv/tcg/csr.c       | 11 +++++++++--
>   target/riscv/tcg/op_helper.c |  2 +-
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 

The code LGTM.  I tried it out with the 'extended reproducer' in the bug and
the fix works:

"qemu-system-riscv64 -nographic -machine virt \
-cpu max,smpmpmt=false,smrnmi=true,c=false,zca=false,zcb=false,zcd=false,zcf=false,zcmop=false,zcmp=false,zcmt=false \
-bios mnret_off2_rv64.elf -d int"


So aside from commit msg tags refinements I think this is good to go.  Thanks,

Daniel


> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..bd395a129d 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -5752,14 +5752,21 @@ static RISCVException write_mnscratch(CPURISCVState *env, int csrno,
>   static RISCVException read_mnepc(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> -    *val = env->mnepc;
> +    *val = env->mnepc & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_mnepc(CPURISCVState *env, int csrno,
>                                     target_ulong val, uintptr_t ra)
>   {
> -    env->mnepc = val;
> +    target_ulong mask = get_xepc_mask(env);
> +
> +    /* Preserve bit 1 when IALIGN can change from 32 to 16. */
> +    if (riscv_cpu_cfg(env)->misa_w && (env->misa_ext_mask & RVC)) {
> +        mask = ~(target_ulong)1;
> +    }
> +
> +    env->mnepc = val & mask;
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index f9c79fe6b9..001241cea1 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -543,7 +543,7 @@ void HELPER(sdext_ebreak)(CPURISCVState *env, target_ulong pc)
>   
>   target_ulong HELPER(mnret)(CPURISCVState *env)
>   {
> -    target_ulong retpc = env->mnepc;
> +    target_ulong retpc = env->mnepc & get_xepc_mask(env);
>       privilege_mode_t prev_priv = get_field(env->mnstatus, MNSTATUS_MNPP);
>       bool prev_virt;
>       uintptr_t ra = GETPC();


