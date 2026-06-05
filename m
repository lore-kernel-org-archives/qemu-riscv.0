Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671F0CD6E7E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 22:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVcxm-0008Uc-Jj; Fri, 05 Jun 2026 18:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVcxl-0008UH-92
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 18:24:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wVcxj-00086q-Oa
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 18:24:25 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 655H1OKo3016263
 for <qemu-riscv@nongnu.org>; Fri, 5 Jun 2026 22:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xx8qpquMqw9bfnKB/dUWsVInqEsYSbsXNhm6Io5PA5Y=; b=RL2z3YDrgIBmtVSl
 fqvXldbacCOGLVNaDyR6XnlzivT2I5IG3h4WmpZrDu+F12ITiCqvsrY5dh3Rb1aH
 7M+KAgf3mm4Wg/ufvRVCF79RiDlZjejBE3OEZIYIKeVKbhIUrt/qZ+OTXrc+Nf5I
 vS91/N8IkJkU/yRN9zjT+CowRceutf2ssGQWwU5B/UUwEzCsqrEg4JG9EVkz5sUa
 DAtu68+1DGQIcSAvlUJ/j7i5ODyFXlciEQ7w/W+Ty9eXFcwRjYQWhuw8UoVo42cJ
 rVd7z3N68hi+Ecr/o2PwCQnkti1FYoBh0Ij3aj1WBFb1p3zMsgbDr7QC9knZ8xFV
 mqL4tw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56kaj0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 22:24:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3074d4102a9so45464eec.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780698260; x=1781303060; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Xx8qpquMqw9bfnKB/dUWsVInqEsYSbsXNhm6Io5PA5Y=;
 b=IUrIDymDp/rEx3whMB20S5PQ8F9rZqIhY3qFuLqmCdXfi/B/K+icecWG6iQp3weoIL
 rcX6huz80p2bYME+aYiFXyeC+Tl1/WFSgPvjxhxaBXhesctC6VMPeQA0ZTlfmMp6rImG
 g3m4/yzSKznkKvNKpO89nQ9DtdST9RfwTqGZ9dGRysjgmqdMSACl6qJtiUxMuIR2SQ5W
 K6XbH6e0CDltCmzOXUr/1dz2d4q0Yya34IU2zn+lZqa7ubTliEUP8OV0uWhmoCI/d/eo
 9ar3gCI2ppVj4jWMZso9xzfB9NwTU3nBOD8G/D72hdjE2BWMXvgAmXfmLgG2YhxfyBIL
 9nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780698260; x=1781303060;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xx8qpquMqw9bfnKB/dUWsVInqEsYSbsXNhm6Io5PA5Y=;
 b=KPsd/YOpItU+xF/76BFwhY9H4T2pEReeDfIoUN0DdwBers07XtPrtplnsR5d6CH4JX
 1hnnwDBd5ZyNyFfxk8MCkd8e+NN4tijbw38ojfUIVdSFbJYK6QXzpX2JXL/qTO7noCun
 kC1ICeAoiFcuCF47gYl0I61nod6huXD47k9/y00Wn/2s5sIy7ag6YusxG20HgQ8bgI+l
 q4iIrDTpUB6ZujB6/IODWlRasWgolF8c2AH13wVM7VzM5V6Br5domS5/e0bGsyMY8rX0
 vcjWcZpiWbdl94GxSaB3GyleISMAs8LmS8tFbuNDJ4Xow9+Ei6Z9DTsBCNZyjXv/TtfR
 cMZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AlSs8xCt/JBQq67XAeQ4v1XL0y7/BRDMmVJiMlu6lsXu5etzdSPaVEY0HnQH5IKO2UZndI9J9B0wQ@nongnu.org
X-Gm-Message-State: AOJu0Yyef89FpISHb/Oo8Xo+fFXH/miWgV47tuvymmB0zVTg/Hn90l0b
 ITVAIrRV/JkEfMueSx2y4J7TdFywjL1dyMHWnpLmYvG5a7u7o38oW3r7OB7tm+JwlxOrGh98tM6
 eLnWELJoMj+V0ofc+qC+rO5c40NkbX2LtF6Glm3i46rzHalIQkpiMDjKmMQ==
X-Gm-Gg: Acq92OEnDC/Zi4zOO/N/fUyiLpLvZ/gXQS3ebCI6OuDWwkigGLmHOVNB1u2PpAhyTmT
 NWO7NN/B8hMZ34Ya6hGohWcADpd+80RHFekf81tn3C8BTCTuPtHeE2uXmZFL46Fov8t5OHp6wPJ
 GKZBSjBQkKuG55UkKwvbaJOFu6Kk+6aLPEvIFb9dZQxfeZVEVrt7+N6e5ek5TQ6AoTHzeCFYdFm
 cDTpMAxPLEwTmq1/hyLtHV2go7wypoMsywDYuTrdy2GfJ2ySLxfjYc8o0hb0SmazD1scIx2Libg
 qk/Dgd6/FLohg+/PgNlaTfdKF+pTis2IhEJDOo5MOJqnkFjRtD44nP3W4YmDMgXNFIrAtdfQ4yd
 iZ9ADokz6ZWp/jaYq3LyRLvDNwPvc+ECQj4bSmTc3gg==
X-Received: by 2002:a05:7300:a886:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-3077b2de88bmr2959051eec.29.1780698260103; 
 Fri, 05 Jun 2026 15:24:20 -0700 (PDT)
X-Received: by 2002:a05:7300:a886:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-3077b2de88bmr2959033eec.29.1780698259484; 
 Fri, 05 Jun 2026 15:24:19 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df8076csm9634899eec.29.2026.06.05.15.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 15:24:19 -0700 (PDT)
Date: Fri, 5 Jun 2026 17:24:17 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 leif.lindholm@oss.qualcomm.com, Fei Wu <wu.fei9@sanechips.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
Message-ID: <5y2sdlx3pu5oyhrm3yxxkvkwv6pl3bpvuzdpnlqg4xt3l2zrxd@yi4h5x2f2xze>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
 <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
 <9b05368c-972a-491e-bddb-7e015100eee2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b05368c-972a-491e-bddb-7e015100eee2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIyMSBTYWx0ZWRfX++ouLWpGF4YQ
 jjsrmRh6qkh0V2sUCTpKQ5LybBlQVvFrwXeeJzK9EkCnLd30GsMJIrjJ6dhOz6FXzrC7HCevZzb
 ODSznypAGDeb9qu5lu7zi2Xq3H/x7JXu1Dakycr10U1K0LSq14p5Ek8KS4NLC8uQqgn312dBp0j
 pAuRCO0sdFnhBAHKcROAaIRwgncavYSWkZ/QxzDruRXVz/y/JhrVma0ZfkTtlUCv8UwGgLoNMSl
 0UYJXeBvS/OxXamdcSN6Ce5FwlBFpGci4W5MBzEWZR11DsO/1prkNXFDTE3xLNZrBAynf78pvb7
 RcS0l6ttuDON1XXeUl9bnH5goVX3YqtjNup0SQlX69urF2wezrg14E+QiUQ+jlFUGm+cFr74vKJ
 +5JeKeamj19ZVTHooS3FTTvg+wExCoKOczBj91zvQU6ipNdrTZZMKJJiYi9OsS0gZVOc5Jlv1dp
 9mVly0Ij9q5NHutUbBg==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a234c95 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QncaINUWJZKf2jjAbicA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: RxEKzg-8317kqpek41LJOCKw12vBDT5r
X-Proofpoint-GUID: RxEKzg-8317kqpek41LJOCKw12vBDT5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050221
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On Fri, Jun 05, 2026 at 05:48:18PM -0300, Daniel Henrique Barboza wrote:
...
> > You're correct.  We're not initializing satp_mode to max_satp_mode, so the
> > default value is being set to sv39.  This seems to be the case for all
> > CPUs, not just this one.  For some reason I thought we were defaulting
> > to the max_satp_mode.  I need to understand why sv39 is being set as
> > default (i.e. why not BARE?).
> 
> Got an update.  It turns out that what we're seeing is something that is
> only happening to this CPU we're trying to add.
> 
> The way satp mode is set on QEMU assuming no command line input:
> 
> - "Bare" CPUs, aka CPUs that has just I or E enabled: default to BARE;
> 
> - Profile CPUs: default to the minimum required by the spec.  E.g. for
>   RVA23 the default is set to sv39;
> 
> - all other CPUs: default to satp_mode_max from the CPU definition.
> 
> The riscv-server-ref CPU is a BARE CPU that is using the profile framework
> to enable extensions.  So for all intents and purposes the code is treating
> it as a profile CPU with extra stuff.  Which is good, but then the
> satp setting from RVA23 (sv39) is overwriting satp_mode_max from the
> CPU definition.
> 
> I believe the way we're creating riscv-server-ref here is correct, so what
> I'm going to do is send a couple of fixes to allow riscv-server-ref to use
> RVA23 as a base and honor its satp_mode_max value too.

But setting satp_mode_max to sv48 is not correct if that really means
_max_ since we want the reference platform to default to the minimum
(sv48) but also support the supported optional extensions and sv57 is
a supported optional extension.

Thanks,
drew

