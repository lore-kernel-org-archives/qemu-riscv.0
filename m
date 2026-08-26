Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32942C61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 17:14:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzHCy-0004t2-9N; Wed, 26 Aug 2026 13:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHCw-0004sX-MV
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:14:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHCu-0007bf-O4
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:14:38 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGupwj1862976
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XjcLN8fU7el4Fh98y3Uavwsv8lvtHLsQAEnAQ7C1TBk=; b=mCkwk5/bsj3JZB7i
 lQuPCTuJDw/3LUfVAY+e6wqYMgJwa0ggksP35rGmuH8jGwaoNU4qjW4xIk5uCLuQ
 vuVl1rgRcMlbhEvw9PY43EuFfm+h7Qo+Oc82OFUHqsgXltpKHFVZebfSkObhbFvn
 6MmuSH87HM8p7IXJqXbrcs1ivG6atwSwoLkdg7c4FRUUIqQOkb+6HwsJiPKViShs
 ano/JkIrfKwPryloVcb6nK5zfl0iA6RkfluNPq7CkQw/EWJo+w0cwK+mCwQQ4V3M
 rtYuA8D+DW59nZ5IRKhYikLgyF9DaxF0hsbMctmVt9SXQpAXegwtgdTye8MMtmh2
 ld0TGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gk6f7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:14:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso21557601cf.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787764474; x=1788369274; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XjcLN8fU7el4Fh98y3Uavwsv8lvtHLsQAEnAQ7C1TBk=;
 b=QXcdMgtPrzRUtDoQ29MvhpULHZyAEQOBYBsL6e3LWE0NxEouhONo8rj/7Ke6DxIpwO
 y9b21C15cqVnirMFQiYPHAD9rpLI9ChEL7H7skranwfV6OiFM3eMo/2IYcqgVtSYkwe2
 l/9JNQCwz4kr9y07R+S4qSrDXIPws4x+QkRYdb2ao39DURSQ78fG3vsclbctTSEXMi8w
 sU+R8Jh2c3Dx9lMwMbvnWWXuSlYk8hkEtQKY7VkTdjczGT5BsnHaNcMi3KooPSRDK9Hi
 GsnrUcgifROUREXrGFs8/qO28Lb+Bsw6j18f2rQ24PCkH8V2IuqGNTy7rwH8jhUvN53Z
 mOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787764474; x=1788369274;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XjcLN8fU7el4Fh98y3Uavwsv8lvtHLsQAEnAQ7C1TBk=;
 b=hmnXmxfEH/ud8dr3ZklyVRkOD8Pd3iBcUMutiszUFmMyEooWUWYJdjtQeTmqKzmRG1
 7+UbprteJ4G4nvnyTjKLHrim9OvkcEUEUDs3oDg/VvuZipOnRfXn919T3MwEA1KiYfue
 /tNI8jLPBk7KZySYJhxxrW03YBB0QVVsZwQcPInbAqt/ZEVT3JanTyPvflaHOtfTnqOz
 oZnmYiQV/a80WgKSZzN+mB1RSm6vyvCwefCAucm74GWISpy0hklFPBHo+gQppbGQfsDX
 pX4DnWPJX6iYCtNpxTyUgA2ZqmMdLtQ+xhvlATa+nCB6fd/8l+VBIhmx1W1iniIb2cl0
 fWrg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpOgcwZC67jq1n6oq9e1clX4rWVZQJJxkirbCjrIloATbAP2J1qsw0eEx8qiDbyUKhNjy5EJkx05hoW@nongnu.org
X-Gm-Message-State: AFuF++m6vVlK8ZgZAuAS3+zgg0F8ra6awsrcmsX8PnfxScLWKTVfg5xr
 SCKUz59wgjij1NPLDtJcJEB9VKjEEPQ+COKHv997T3X86japvTYlb1vkOCKpEkcnCUBljUKGr5c
 iGMq1GdmiDye00RPodmJ3hK4e10NEofQ9jGOugbpYXYAt+qa8RuYXCz3rkg==
X-Gm-Gg: AR+sD111EXSn0y2bu5COjzKhS6HCu52ZAYOPTxjb5vsrQPwdu3UuGgwgKJBZz6VL1b7
 TXUH+fbP9vhBtA3iyeL/Tl3DLYow/EeIePbbwFTRhiONO026t4ScXfvoUvt6q6qSE4Npljilv2m
 /7x/IwRJeTohw9qtjMhnuFU/nbPndyTEuLdANI+mKaK9RHb44AjEdqx3QEuMzQiFjDIL7LqHwJu
 ocbfp7K7nfLFm5kAiB66dmTgj4M6Ar8eJHu6TrCYqkL7XVxT8YbdlP3jWyDLcvHPzyO5fSl/IcT
 pnZ2q/YSxfOaZGFtC/x5MBNUwOXonSUyZIqwThk7Z0oIWM/8p9JAMs3PwKttv5osNbi5GU5mO27
 ZlRbLwXqgVjTfuytMSsUIcm4Rz9eRjCVLY6SXrCoWgnBF
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id
 d75a77b69052e-52e423e01d9mr86539311cf.27.1787764474435; 
 Wed, 26 Aug 2026 10:14:34 -0700 (PDT)
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id
 d75a77b69052e-52e423e01d9mr86538421cf.27.1787764473774; 
 Wed, 26 Aug 2026 10:14:33 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deb030bcsm6696954a12.31.2026.08.26.10.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:14:33 -0700 (PDT)
Message-ID: <39a94a2f-c45d-4451-bb8c-b6c68a4177b9@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] hw/riscv/fdt-common, virt.c: add create_fdt_rtc()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
 <20260826164814.44335-10-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826164814.44335-10-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FUZAqhBf2PSya4xD8YkMBpcND6EWa0L4
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8f1efb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WGN6J-DbI_Zv_MiG4ecA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX/RU3IKkKjRcY
 yA2ECuzGDQDRK6DSJ5klmThCfNlxx6CuQsW6JNuIeL4AJPHrQssRvNlSPpqhGk44ohufo1y7teN
 6zKIfjllAT/znS9cHSMCtnykeJi/yK8=
X-Proofpoint-ORIG-GUID: FUZAqhBf2PSya4xD8YkMBpcND6EWa0L4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX4C9TvzfzEZHn
 83INI29O/wBtTxbvlu2I/Lf5GyLc9If0jRf+YYZza8Z5WV8pKZCM3W3KnG4ryVkdp7aKmHm7jsA
 2Wm/jEAVFoOea4QBBJ69JiuBTI09ZbQ/TLkqD1w93gP9hCctQVe4VlrgL0H+SuN481aGqZoJfHl
 /2xNlN3elZRwx1rsXdorHgUrhJ676rH0PoCBbRZFXTWh/H4H/Lt0ATTzvbxkgE9KQ8/MJTeNXDC
 JP26xxjo7j8yo7U1ZoUsqtX6SoF2mUuD8rQwSAe2CnGWZJsYzXunZUjNS/kTcbd5ZTV3XRsKIES
 pBIRzV8ZjwsKz4qQM4sB5j9WbjjohzPjeylPJ9H1D+GAVB9Beh7eN9/oZROq1j5x2VnnOBIb+nN
 Y4OJ43i50H8qc+lKIvGTVggOuH0H9s0OygiYWSV7V7WuJgxS1YEUg1HqCn1ADrlYh6ulzZ7665t
 oAIJ/wMaGpkduLvRMfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 26/8/26 18:48, Daniel Henrique Barboza wrote:
> The soon to be added 'riscv-server-ref' board will add a rtc FDT subnode
> that is similar to what the 'virt' board users.  Put it into a helper to
> avoid copy/pasting code.
> 
> No FDT changes intended.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/fdt-common.c         | 23 +++++++++++++++++++++++
>   hw/riscv/virt.c               | 26 ++------------------------
>   include/hw/riscv/fdt-common.h |  3 +++
>   3 files changed, 28 insertions(+), 24 deletions(-)


> +void create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
> +                    int rtc_irq, int aia_type,
> +                    uint32_t irq_mmio_phandle)
> +{
> +    g_autofree char *name = NULL;
> +
> +    name = g_strdup_printf("/soc/rtc@%"HWADDR_PRIx,
> +                           rtc_mem->base);
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible",
> +        "google,goldfish-rtc");
Mis-indented ;)

