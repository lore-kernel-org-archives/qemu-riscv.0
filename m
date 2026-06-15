Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D547CD98DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 17:36:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZBEH-0004A3-6i; Mon, 15 Jun 2026 13:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZBEA-00048e-Vr
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 13:36:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZBE9-0002EW-2c
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 13:36:02 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FFhaE3805514
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 17:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KnoBfxQsGw/EBGcf3Q+3wi3/zwAVkerjK5ToAbuaF/A=; b=jvo2rcfIrdoWIHuQ
 M5cA6sWWAW/yYofYuEl0/FYuXlfkN2MEyfD8cxrlB+IMgWSU5aJZzX5PupIdDJOk
 LlvshNKyTqqpSTqdWJGZuE/rJXWYn4kTOYBqF6wI/5/VwyedM6pT041NWwsiXzAc
 F13y3sQhGFNRpX0mfeJzvg7XGh7ykfS7lfpHSmbA84JXVSzaPpa4UCEm7ag3jC04
 dR0njzzMwpWjp5ZdvfnvpVRNv/bpUxI3LR71JhHP4M08fq3pcQUclEhFVf7F4LJ4
 zxQNl/BsB1+4Dq7XA7vLVQamAdPoaKKGCFmIJt4+cNhzseLeysbGn1UAuJusemUs
 vvTEKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf21rs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 17:35:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9181f3cc5ecso422287385a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781544959; x=1782149759; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KnoBfxQsGw/EBGcf3Q+3wi3/zwAVkerjK5ToAbuaF/A=;
 b=ZLicKNSjXhHV2xsAim9S0ax8WKjS2YnZrKnrN8pjDuE3gFxf1JdKspDw05O2/fTodw
 fdClPA2OspcqjrgEpJ+CSg7s2VGGGZgZ7f1Ca7UgyyUk/92xKIn2fy0A0Ne9qQj8Nhwr
 fBmoKJpYVd+zhHN9aGxHdk9BU32dOhXg3BZm+udgkwPTKrhtNt9KlhTU/Ez98Ffd9Xq8
 gloe1LomIAoQe+2jBXFweEGm0boaaQ4PnkLZLIsEn3o3g5dYIDEAS7q3xS66k1egwYxg
 gdRnb63Ewu9Hv+mYSBNTugQwaKpi2UUm5VVjXcNnOeDJdUvwrh8qHjNRObkkSAKm84p5
 n8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781544959; x=1782149759;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnoBfxQsGw/EBGcf3Q+3wi3/zwAVkerjK5ToAbuaF/A=;
 b=VXmwh3uhJzqY+y2gCnSIARHEOjQiECnYwZ/kRwmPOpAJS5h4theEda7n3wlDZwXtwC
 mnxDGKuyD+6pgYeKIZN7pGG1k5Lrayn4i8GX2in4CUlVwQf9kCarTULwER/K7dES/kUT
 q/Z3AsULXiIHUpatItrw8ifyzlXNdOcegVAKwHkwYNEVtCyVp1/FByz7dEdgreBwOLO9
 +hqGSF6/yL2WWM0GohDZh4NLG8AoTgeR5l8bYrUVbmFP+Kn53fc+QgqnnEMWX8HYMpNu
 hKygtrzaXJppgZLZTQGA56x99GNcytJXGoEkJqDE7An3tIoxHEqgl+oh4i27eQMVnPc2
 +5ZQ==
X-Gm-Message-State: AOJu0Yx+Lbvoox3XKkEEwhgLyG8G6PucZ0IjrDPTpk+dfgUpZnyQa0se
 voKZGSA9PB0JbvU2gokdxZ8Nw3fzAUFsnidJrxYfqeRjmglZXDBBI62d8fxysvMT5kKJeEZdzIS
 e+kxMbPvwiaZSL9A27iCpRyivolPzKtNn4lROow3FsqjAXv5AnGwDHxhsnA==
X-Gm-Gg: Acq92OGzzjaf72B/iEiFX66mNB0xsE4H5T7KFFtNZSyMafgGSn9CaxkuGHUbckfLG0y
 cwTQcMrdBs41QqzgqIVinNIleoIioBDwnw1mswsUDBBh1qdL3ZcseSg5V2Vj3gPyR9lroylrTUw
 naixI4YMTe+HkfwSmM5ELGZCPVMzcaRmz9A1S60SgBOTzXgWQBvZdYp6gE5NTNZeozD6UFDVAXb
 k/GjFLCSnr3lEJBMlh+rM4W+EtE9yI/DS1XO8eO7W33wxYP6hH2t1qGWnLt5nQCsWMQ9onqqpkF
 l6U8IbAWnEs3Okl1kZRzkj7M/x4mMwtj2B1U5QjdvQCCzL/nn97mA1L3hIClP0sPziN1ochOj5p
 /TaWdsfLTIE9ghVODKRL7dBL3HwYpVcHkfr8/ZKFr6eaFswR1vTXaCIbLiw==
X-Received: by 2002:a05:620a:2890:b0:915:5216:e5bf with SMTP id
 af79cd13be357-91c2eedf7bemr56366085a.22.1781544958804; 
 Mon, 15 Jun 2026 10:35:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2890:b0:915:5216:e5bf with SMTP id
 af79cd13be357-91c2eedf7bemr56362585a.22.1781544958333; 
 Mon, 15 Jun 2026 10:35:58 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-91619ed7857sm1170833085a.4.2026.06.15.10.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 10:35:57 -0700 (PDT)
Message-ID: <96088690-464e-478f-9ada-465f44ccfd08@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:35:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: avoid abort when reading vtype before
 env->xl is set
To: ZhengXiang Qin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <tencent_FB929239B227F05F30D62745E38BA01D4307@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_FB929239B227F05F30D62745E38BA01D4307@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a3037ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=hAGIOy7kTBAGDZmiKR8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: UdOkFusjOy8t4J4hzMxW28CVrbtzkKW1
X-Proofpoint-ORIG-GUID: UdOkFusjOy8t4J4hzMxW28CVrbtzkKW1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4NiBTYWx0ZWRfXxgCxZ94ic1qQ
 1xKGtEgUePofMjv7txF9k0Jv+zxixungvZ8h6dIu7l2rEEHjJl0iOVLZVqSCSlE0tBs++8OWJ6s
 Ba3bYbtruFZUNffHKxgEicfGARed8Tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4NiBTYWx0ZWRfX0LJAdZHUid3o
 EtriyPH000erLwZ87krsP7J/kw3UrrGkaxBY4Smo+czPkmsK3hfKpGg1rH+nkNxTVhnhDt/MY6m
 /JaW2HUJ9JLoIAagwoHPFmacfTcPSv77L1Tk7X42gRfe2YE2keN6c/kSlQzkxOnNw03U8xUlNrJ
 7UIlSG6UgK1jbOkobZ5ZU9LT3LIQIjGOfvSM7gwilHGYSEDDe0TGEgvjD96Rwyp2W9RzPUA4Ele
 4+jn6h+ta/jwR9vm/ta2WV/spgya8HUF3gb4TN+lQ34qZLnZmCGrprQOTSBaivr+mG9d09nSi2I
 MddwNQ0U2j68gr2j5w2YTmKpkPdBjwINw/jDm+CECFG3A8U+obdn144ljo7+6KvfdnTMOkEOVNd
 9/n87wTrJC0ZIVA2Zn/sanb5Fz0U0PhapKhn34iQ6NatlTaVIpQ82rxzsOFvZF5RGLtQT3hbnmh
 pbVHOX1ZqkRZUUjScUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150186
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



On 6/15/2026 10:24 AM, ZhengXiang Qin wrote:
> TCG plugins may read registers from the vcpu_init_cb() callback.  For
> vtype, this reaches read_vtype() before env->xl has been initialized.
> 
> In that case read_vtype() currently hits g_assert_not_reached() because
> env->xl is zero.  Fall back to the CPU's maximum XLEN only for this
> early-init case.
> 
> Fixes: 638181a180bd ("core/cpu-common: initialise plugin state before thread creation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3545
> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/csr.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5514e0f455..6ade7ccb0b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -936,7 +936,16 @@ static RISCVException read_vtype(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
>       uint64_t vill;
> -    switch (env->xl) {
> +    int xl = env->xl;
> +    /*
> +     * TCG plugins can read registers before env->xl is initialized.
> +     * Fall back to the CPU's maximum XLEN in that early-init case.
> +     */
> +    if (xl == 0) {
> +        xl = riscv_cpu_mxl(env);
> +    }
> +
> +    switch (xl) {
>       case MXL_RV32:
>           vill = (uint32_t)env->vill << 31;
>           break;


