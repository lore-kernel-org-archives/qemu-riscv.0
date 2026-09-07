Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04877C79F89
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3TED-0004eP-C4; Mon, 07 Sep 2026 02:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x3TEA-0004e4-MY
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 02:53:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x3TE7-0007ck-QJ
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 02:53:14 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6873l5El3102645
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 06:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FdPJ9gPrUT4lnJemglO50MyNP2L9Kt90VuTJX6E75+E=; b=LhDI2QdXk5aqgu+u
 5PKxXH0HfZOd0SJW6gfI6ESfQd9nrDy/a2vFxyQvCOePJ5zYy17fOMsky4qQndQ6
 uOa3sZKP0ji0dBtO82gKcR370CR0gWty6WQmcrDhxOTRJgSvs+OUQBZbkae1ZvlU
 hzXXBlqOz7GmyLweekxqbUkUDmo+zbAPayADeu9eKuhX2A6NrNxZEkv4Bgu4iVvc
 Or28RQ75P1lBXExUGn+tbLfU+RG1zjhOpvb0ERizrBpNbSb7aVbHiG51Lzwx0JkB
 5mrgDp06VynvqjBA8kCI1xjWIZ4XmIVErKb8at0koPrYIYUC0bxS+I4+4SQ7u2Cg
 1yQu4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vdarb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 06:53:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2d7443e0f0bso48721955ad.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Sep 2026 23:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788763989; cv=none;
 d=google.com; s=arc-20260327;
 b=B/G6PBdObmqikvodaw96yzAVvO2+ijZustXOJ60VSYb29Rd14q+qqsHixAlEv7u9Vq
 G+gKm8xx1QNVo3xdMkJ3iULp6f+f4Aed+8BYaTQUeQH55yjm//ngwdh64lfiKIKVmksD
 /frqdwc46PuhtsdWE4+jY9KFVkyuyS2aFCIsT9D/O5xBx8rl+1O1Rbd4kiLHfopPbydW
 zTazgPDssCiv8hvuSoWyThUXi++uoCVVd/qjitugEsBEn2ikD7oVtNZttbpHFJi/II8a
 TdOVF+LBNb+0Wep5W4vOVsQueCmrkU0wr8253bfaxHQvodGg7UPapeIwhQFV0j93IQA5
 TRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FdPJ9gPrUT4lnJemglO50MyNP2L9Kt90VuTJX6E75+E=;
 fh=jGkkW33iFpdWLmzEzCmDJMoYdPbtIhxX+do03AQYKnM=;
 b=NbmwAkn8QCW2IriQRSZG6z9OL0+U/XLxDvBshhVwDdI7m2u2Sn2l+Lal6vZSsJjxbR
 Oniz/1xf0lNvwf1YhuMpbPVRmVRHPIiJNaTCK/v50wrA4jn5fHZLdM05KPWLThZYMt6M
 LHA2WteUZXW82/bXefPhkbYBBRB2I6YCMwf9TbwocBmgQLvsbEkqxUcwEQwK9iFbRldg
 MEeta9Q58tw89A93BmYDZhyUJe6ZcfO8fItH13E4qsCg7N8bVvYtOQBM3d9H7Te5crLR
 j3vWwJuq7JeRuJuxTY7bSi3v9DvTAMWkrRgq5jJwLPUAwoKQfZwaX1pWBqL0KRcqeRjR
 AA6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788763989; x=1789368789; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FdPJ9gPrUT4lnJemglO50MyNP2L9Kt90VuTJX6E75+E=;
 b=TiNIKl3b3+M0LP50c3ckz/B/JnoxPINrKhdK7MOP2IgIvYDhQtV5/v3i83BktfKT4G
 spe7PvUHh5svDH5PmXKskK3gzDD/m0bSgR6WHLO5xqpwJlejA4/1LsahaItA4VRJNDrw
 rxADToy7+45Vui+5x6r/1iCwH10XfxNLbAwbrK0kZFxvIXE0tapgZdcyg1FpHrwFdaBj
 Z/D52RxWQYOK6oBbFfNS8wLU/U6UPQ2DIrLSIzhTV9Kafyrg2AgzhCdyRdGXjq/b6ZNg
 bMUEHdNqTTJYzrI2/Rt12InEqucO3nyrw9//h75q4V4pppHpUr3cchxI3cdhsKuKK936
 xaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788763989; x=1789368789;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FdPJ9gPrUT4lnJemglO50MyNP2L9Kt90VuTJX6E75+E=;
 b=G7iZ4hpenbNMRNVu7RNrGfaM3mfTcCfC9yzBKoJRBBXvf2RB5mQEoxtWXS1AlLpOFO
 c74fhSyB/fN5xKpqQyS44qySvD8mQSCZEclaMunjuSx+3rl/IT6i6woBc+8kpDdk2UXb
 UmoNFov3FNqTj93qSvNODI59XeGUq90e/7cMc0vUmjE2rdxx47aee8dmy+y5ZX1xxZVt
 MCbxgw48ZeQ4t0LmQSkEBeZ9tDILdIVTiYvzFo+/fG60Gmr7Hib10Ts0gBKPNqSiu2Ym
 iNIzc3bg4ARa0rQHE3GE6iThx7yt+oy3Gu0BPGVt7Qb3MZQzWXdawUw4yWYixKxxjtFH
 qpxg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwA3XNBFqapagng12e50FwNzxAb0+RfCb56UVtZSrVlkofbXQcjsWJmoMyIS8Xr4wQbt1Ng8k4wyW8f@nongnu.org
X-Gm-Message-State: AFuF++m0RHyhRJOTl6sW2EnXpxps/N95TqnXt7qU54aeQaAiKl67a5ks
 KOLKHdeidXms2MYIsX15UsHG2nUegqtRmB9YSSzrT1u0FvdwCZwLHBQTKqOrPbZ9n/6/VpyDCaR
 SY/hQ1JC/W0foxdcPokw5BhG8EhtEmZS06xAxwyv5CntluD6Rw9ocW7l33vYumBuYglVJ5Y0Uw0
 EISWFaCd/btjcRNgfO+QfEZFsAe6dj9kPr
X-Gm-Gg: AYBFou3lDl3PI92deCc1WqQSl5OzQPKNHt3eJ8NxT3JcFMRgbyc8FTtFyuSL8Ha29Vz
 3sVJprp/fji8Csd4T+GphPGqI0NSvMl6mz9zBXn47/RiwvFgkq6YAUFZcgnDf8ONSVX4X9BBiS/
 QLwwVKn/FD8tdrQRFw+f9xo9Dl1HKTdrg6SWJz5E2QhQBPZ1v5wwgOPpfNFA==
X-Received: by 2002:a17:902:fb48:b0:2d7:203b:9863 with SMTP id
 d9443c01a7336-2db1232c6a9mr207428795ad.1.1788763989297; 
 Sun, 06 Sep 2026 23:53:09 -0700 (PDT)
X-Received: by 2002:a17:902:fb48:b0:2d7:203b:9863 with SMTP id
 d9443c01a7336-2db1232c6a9mr207428485ad.1.1788763988864; Sun, 06 Sep 2026
 23:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260813134002.862578-1-mayuresh.chitale@oss.qualcomm.com>
 <6354eb8b-7319-4e03-ab16-12e8857added@linux.alibaba.com>
In-Reply-To: <6354eb8b-7319-4e03-ab16-12e8857added@linux.alibaba.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:22:55 +0530
X-Gm-Features: AcwNN1Xv4AX6I-IV47pMem2cxxzStcnlz0pAgL2SoeiiBcU7uoVVBV2NEBreMqU
Message-ID: <CAHuiULA+aYJa3428RYpORV73iyZ-svzmH=JyR6gj77WemhvfSQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix LCOFI masking in sie/sip/mvip
To: TianCheng TANG <lyndra@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Gong Shuai <gsh517025@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: MGWMrfHlTiRp5Kz_dMrWesv6BS4sOx02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfXx7PicEAKk2nO
 x+qIdauU5UENenG3D5kTIzm4Lwvj+Nr8y0pw3k6Uh4GJ+X5vHhjsEihoF2Gi3zd3GCv+1mt5HSB
 dQNg5ZG6VBRcyNHFIMRshFWZsGiDXkUoVemNalIen5Ea2ykmdDCgerloZvXQ6m+Z9E++vvpJTSL
 wbUvgpzrDEjVvd+QuZ6unK+fZrDhODvUoA2xEVJF2v+r+taBX4uAjJPv108GiP/V+p9HBdak2s6
 jIlIsqK4CS8iuMOMGwvGlUqh5ndVL0xVAI/NOXi5eddnibvUNPaYVOahClbrJPqSfd5d5jH2c74
 zbB7kKrmHBPF7BX/c0zTJvp3yOdLOb9M8IWxgyDuZifQ4brNkdKH6iV9zxb9BQf5xKWNAzbscP/
 BIRy67b2eouwpfnVqwQNGqc9HPBVPrloNXRcTq4UnSo+WupEdhBH7P9VqhrEnNENpqeNmJdM4B0
 os3d5qJEVPS6D6ivc4A==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e5f56 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8 a=SRrdq9N9AAAA:8
 a=NuDas1xL7WfDCPMZ89QA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: MGWMrfHlTiRp5Kz_dMrWesv6BS4sOx02
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfX+Ce6eL581NL3
 3Cd8IDkgVIASycG5+tcMFG77+cib+kdJBqGssZG/8rl85b9CLa0zI4DfDfDB8s1L4ZYOwChVcN6
 ieGCdJi+qhpae/7T+0Snh/iRyzzan5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Hi Tiancheng,

On Mon, Aug 31, 2026 at 1:45=E2=80=AFPM TianCheng TANG <lyndra@linux.alibab=
a.com> wrote:
>
> Hi Mayuresh,
>
> Thanks for fixing this.
>
> While testing related RISC-V PMU changes, I noticed the same read-back
> issue reported by Gong: rmw_sip64() also needs to include LCOFI in its
> read mask.
>
> I also noticed that adding MIP_LCOFIP to the static masks exposes bit
> 13 when Sscofpmf is disabled. The specification requires sip.LCOFIP
> and sie.LCOFIE to be read-only zero in that configuration. Would it
> make sense to condition these masks on ext_sscofpmf?
>
> For the virtual-interrupt path, Smcdeleg requires both mvip and mvien
> LCOFI when Smcdeleg, Sscofpmf, and Smaia are implemented. Is mvien
> support planned as a follow-up?
I have just sent the v2 with this change.
>
> I have local TCG tests covering the base, extension-disabled, and
> virtual-interrupt cases and can share them if useful.
>
> This also appears to address:
> https://gitlab.com/qemu-project/qemu/-/work_items/3969
>
> Thanks,
> Tiancheng

