Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC93C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 11:05:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsINj-0001Cr-Ai; Fri, 07 Aug 2026 07:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsINh-0001CO-Kx
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:04:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsINf-00067i-Gw
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 07:04:53 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6777iQ1R3533333
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 11:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HnwgKbBW3JF2Vo+MkABsFuBwZTQx16q+MAGpnqX1guM=; b=JjoITSMQKi+zPpjl
 37uTorb3B5uijxy0qcm2rlUFL2RSjdDSBbaBFLOPROdViRQ0WHrvF6cmtfM0wfaK
 yYsD3BMkMLA7h3FQXx2KgeAqVBymsHEnC/4Nceyi3AtEcxaJz7iF9jKUU3NzgAl8
 7b2kRaSG5urbqZQyv810ux6A26py2RfHQj4ua3lAFFjjunb/37RWsulaiS/OINgW
 7jhWyYp7pOkKoqBQjJv4FwffzYYekfFxkdi8uohkl3857xolSEdgzLBgXNGi7nNo
 H8/sarfMVjtaGQX1Ng12w4jaiDXHEzbRTMnQVHlLZUx3SlMiuNgBMWMf4Ru7l3Ic
 BaMiRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fup8m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 11:04:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934963b2bc0so323114485a.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786100689; x=1786705489; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HnwgKbBW3JF2Vo+MkABsFuBwZTQx16q+MAGpnqX1guM=;
 b=DWOBFoi2QvqYITohAkheJ33gI1jKNlRc7gm7k8RzMJaE7ERFWr0ISC4p+3PIocdwiY
 D2LlCovYlQAs5kp6Avzd53Y7djGoegUAQhoiqrJ01Uejn9HI5pXZc6LJcgp1oYtH+B82
 Uc5ejyXH463VGN/eaXGnBlMTXVExcZq8WytwY6YNwW+Kjl+ykzMiVNHrt9itOi/8Qr/H
 9zdTEa2HUGJ+Otd7Yi/Msk7akgbjtE3eEy7iWNucAVX5WOfN9gmnApgou/I7QUcl7jHt
 UrDezprj+tSkC3pPBqLZ3SpkF2HbgZbyc00ozBjmU3TmwJxyohfuRwJJ6frVo5VL5dx7
 oXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786100689; x=1786705489;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HnwgKbBW3JF2Vo+MkABsFuBwZTQx16q+MAGpnqX1guM=;
 b=dDEcNzR5TiD6P8hf2mEaFC66UOA5EJCWJlKIPlTkupCsT8XN9+X1RYhIMgt5tA5o6t
 +YHmcmqRz7biuV310Tk/frmWLCKknK7NBEVjQm3BHbJBcgHYiwwIH3JjiW2itLmkzdKl
 wrNIz8n9mCEeuD2J8BUrWXPfRoM3QvEaehpBMNTcaAlCCwNiEAJ59JhlYJxffZ/ayz/M
 gxJtn3odMyaGWnjoffds7Q2D/YvS+LV/HdjWuQikM2rhj1lUcESqH/o/2isoe262V26V
 NfgX/eSlTnHZLA179yjEL3l6ZdnTc2TFuCurnL9LwGu5znaeEMb/GNc/ZtuRaUuvcnna
 ZF3w==
X-Gm-Message-State: AOJu0YwjYx4oEyojuLNkPRM3+Kmk/09Vpil4t9QjHjdOByCmIHa2xU2t
 0b1JGFvQ5AJJ6iDyvGzUwih2IfmVgSHTMzRJZsJ0ylJREwnOKvTqZgu/CU9ZUCjytegLZSPtxjg
 4F6MtcR8+BQrHvMbLMgsTa8hjqHrvI5cQO6LO6HxlEj6JL0CzA5x6eV6MiQ==
X-Gm-Gg: AR+sD11Psyap+S/Ktu9eFbz9/5cCF4hBfSp+9/UOc0RMqb2/FmgY6G955jpy51u+eyh
 Ce0vsqwc+e4j5yVEmkabjFaczBDElo5pSiB5x1/FnNvghkS18Iv4jA5RPRCJA/Hup8WRlfpezuk
 BKIuGnxZ+TLr7vrdZCsIqe6bPqH+MDJfT4qyATvgn11MmtRxmoygktQwTHMEjIs0jqmUJZ8Ur5I
 6+cDHQeval8xal9VFFqbg8x3ELDyIusRSVor9ftjPqkazIrDSLKsccwGJdNLe1J23i6457RdsGW
 aZaUtKJrLucP7YqW6zfSZSoLnEGYQetz4tp8ZMC+CyqNg8Xxk6nsH/i1W5QQEycs/N056Ga2iT8
 IWCxNdhvo00zO7jjH/mALGeGEes3m0Z/uP4Th
X-Received: by 2002:a05:620a:a918:b0:92e:c93a:65e2 with SMTP id
 af79cd13be357-936492aee28mr1976262485a.39.1786100689026; 
 Fri, 07 Aug 2026 04:04:49 -0700 (PDT)
X-Received: by 2002:a05:620a:a918:b0:92e:c93a:65e2 with SMTP id
 af79cd13be357-936492aee28mr1976257585a.39.1786100688615; 
 Fri, 07 Aug 2026 04:04:48 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e261918sm121192485a.34.2026.08.07.04.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:04:47 -0700 (PDT)
Message-ID: <896d54b5-a373-428e-8256-9003b2697744@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 08:04:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix PC sync in trans_sspopchk for CFI
 exception handling
To: A-Shehab <ahshehab24@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260730181852.1622-1-ahshehab24@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730181852.1622-1-ahshehab24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA4NSBTYWx0ZWRfXzSnz+NqfV/BF
 xy47U6kjsG8AMgfJYUMAID7rzevScHod1q6DoAl815KgBtn+sinGiHiAwDO/03puswcdypCLYAv
 JJkRspQhp61drpFYWh8hcNThUQuZZTRWLYfPhURTkjFyq+PcfRIGM/OutFmbfZc6v1GEbUQUNLb
 +0TIZm/QfnQvqFvPAh5jnZuTmjRkFptV6fk2y2yhaNbjz9owY2QsDy71DG5yRR2MuXQrdlEbq0v
 tifNp1vRzIvoQO2hHmZa13tQIeoSifvX2F7E/FeJaAIBRPmJABnBNrRzQBMQYyGgjq3TptJplHK
 sH1H74/ReXyV9R2YCKZLzO38jH+96pAFdzFWOk65IkI5y6FGTa1jvw9SXxMqLjn/t/J6Sw00xE5
 qxy/ZwFQYxPy25/TeVi+akIyuiejMlDelpHzL1N/EpAr24lUABeE/CtnMfJNywiW6lVh9fO9mko
 8QGUhlvo0h52kgl6O/g==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75bbd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=UFTaeZGCLHsyUKFxc-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: LBNveEO1WbI5VKOoNz0bdp9es5UAFg6_
X-Proofpoint-GUID: LBNveEO1WbI5VKOoNz0bdp9es5UAFg6_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA4NSBTYWx0ZWRfX6qYH6yFCHnS7
 jwgRjf/TNY6ZQTL9CGaCmyNB9xMrnXk9MJgzGdsmbv2jM1EHTN3hRD9gau1q/uJw2SwcfJiZ7C+
 x8WjWi7p0f57/5pn25s8o45pvtbX4UQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070085
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/30/2026 3:18 PM, A-Shehab wrote:
> From: Max Chou <max.chou@sifive.com>
> 
> Move gen_update_pc call before conditional logic to ensure consistent
> PC state regardless of execution path.
> 
> Previously, the host instructions generated to update the cpu_pc were
> only executed in the failure path when shadow stack validation failed.
> This created inconsistent PC synchronization.
> 
> This inconsistency caused issues in CF_PCREL mode where subsequent
> instructions calculated wrong relative offsets from stale pc_save
> values, and could lead to incorrect exception return addresses.
> 
> This fix ensures PC is always synchronized before any helper that
> might raise an exception, maintaining consistent translator state
> across all execution paths.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4118
> Signed-off-by: Max Chou <max.chou@sifive.com>
> [ahshehab: rebased on current master; file moved to
>   target/riscv/tcg/insn_trans/ and the ssp load is now 64-bit wide]
> Tested-by: A-Shehab <ahshehab24@gmail.com>
> Signed-off-by: A-Shehab <ahshehab24@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> This is a repost of Max Chou's patch from 2025-11-05 [1], which did not
> receive any review. Rebased onto current master: the file moved to
> target/riscv/tcg/insn_trans/ and the ssp load is now a 64-bit load, so
> the original patch no longer applies.
> 
> I opened a GitLab issue (#4118) with a minimal, self-contained bare-metal
> reproducer for this bug. It runs an sspopchk that matches the shadow stack
> (the common case) followed by an auipc in the same translation block; on
> current master the auipc returns an address 4 bytes too low (exit 42) and
> with this patch it is correct (exit 0). The reproducer is included in the
> issue.
> 
> [1] https://lore.kernel.org/qemu-devel/20251105134331.2865581-1-max.chou@sifive.com/
> 
>   target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> index a813232887..d47a9f9c7d 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
> @@ -32,6 +32,7 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
>       TCGLabel *skip = gen_new_label();
>       uint32_t tmp = (get_xl(ctx) == MXL_RV64) ? 8 : 4;
>       TCGv data = tcg_temp_new();
> +    gen_update_pc(ctx, 0);
>       TCGv_i64 wide_addr = tcg_temp_new_i64();
>       tcg_gen_ld_i64(wide_addr, tcg_env, offsetof(CPURISCVState, ssp));
>       tcg_gen_trunc_i64_tl(addr, wide_addr);
> @@ -42,7 +43,6 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
>       tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
>       tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
>                       tcg_env, offsetof(CPURISCVState, sw_check_code));
> -    gen_update_pc(ctx, 0);
>       gen_helper_raise_exception(tcg_env,
>                     tcg_constant_i32(RISCV_EXCP_SW_CHECK));
>       gen_set_label(skip);


