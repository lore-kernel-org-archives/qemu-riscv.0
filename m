Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6509CC79FA0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:30:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3qHk-00015E-6G; Tue, 08 Sep 2026 03:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qHc-00013C-Rj
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:30:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qHa-0008Ck-V1
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:30:20 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6886M2oJ2072217
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 07:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=fGPNIPCMK92NLMPG+emyq6u7k9/+jLH2qHU1vjFkODc=; b=IL
 83+jmgfikSa6fVCujhw0mYZj3sV4vGrzDxu264a0VhZwmu3t4PWUx0WSRst7lOcA
 BS8CpPaw3VQ7BCW0t65wEkPuO2bINRP5HRv8l/e3jeAqrq3pOZcLhRukAB/G3BqG
 eCCJ9FC0xebc2pxMqt24oAjIZfxynX5VURnLFu7uuemSxA3NDMJOdIRhowB9I4hE
 PERoWVPgSARefejziXDdaufge5jQaHlZf61OeqvJgdOqDt7gX3sZpMPD2/E2oy75
 uYzPBsAOOzhCgWt4oJK5VWxs9VXDrq11DdHocsc2MSd0XXHzKHA9lBlvdL7RQJJs
 pZcT7rf6D0PzFu6ht5aw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfymbqw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 07:30:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-8546e211940so63061577b3.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 00:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852616; cv=none;
 d=google.com; s=arc-20260327;
 b=IPAxB+yV4FA2hM7lEWBg2PqjvSZcNjCEXM1c8RNRnJv1o2DmDV1ilqKmlEMhLDXBnW
 VHTM4OE2pEgLqd/kn1/qsK8+p1DmPmMUDkAprferBDnjnecIO+zCnPEz+QrbJSAhQdno
 qNCuBrHUUP/Zl5Os0atBWRPtqyj5ONPPT415nqP/oBRJceVxaTRtcT3PgxCrzsH4W2JE
 a1Ni/COTvAP3W81cnxSmXaHBfQZnAzvP0I3qSk9MY8GAqr1dh6pmyU4ZWC6aID1b/clp
 r/eVhQ2QWhHU0FW5wUOZeKX1TBVtvD/W0qZ/cKTqBNFNi3t49RkIBdAIz4DMh+JKveH4
 WaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=fGPNIPCMK92NLMPG+emyq6u7k9/+jLH2qHU1vjFkODc=;
 fh=B/3m/OasZfR5Z+mgbb4/EY3I5YxSrPIIElAiC5b8Yrg=;
 b=e2w9S4CBgnbQOyYTiaQQ4ZFJfwjw910GcQu52PfyJ/8RqIx9q2hoF0Z9ZvyrGar95a
 Q60BInzM2f/7FUtreB2ZC/sd5ampHrQ1Pscpf7/lWfRzeuhxdCQS3jA/37arTFgz6OKF
 b9hyk9llFUyeBU/X1DxrbT7jHbKqauhNEL4BDHiFClRRAfslVd5xFwPS30eKFWxfUODL
 OahcZLjYIzSqubnw0TIapSYJ6QV9SFuxqQqlhoSdk+XHRVxhUV0XBvPODko5YyPpqlpA
 5kU1ItDTLMJ2Wx2KIKoHnW2vp2xjqbyYtlwL0+RzIOB6cEb6g1j+f1e5l3Xu9p82/aTM
 cJTg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788852616; x=1789457416; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fGPNIPCMK92NLMPG+emyq6u7k9/+jLH2qHU1vjFkODc=;
 b=brr+K/MrJXPfbGG85Zfg6UrG4Vng1jzkjkg10me3Q1hKeTjJS3inAmsE9dD4jvrM9o
 03iYxLZT1MiRaj7EmRZeF/UpWUT3Snpo6nTZdXM5tQWBkd4x3Tv0gLKXfgZGBFh0TPbO
 2QisbtpshsBIwHSYPUpHPyFZOOoakcUOylGi0oeFCGN/yNGOta2NWyXm35RGf5gnlMg8
 yirtTBNDk51ARRdTvue+Os/h0EuUGMwuwPnVZoUDgnjG/SaCj+f5WXxN7JjxGSgY9JS4
 2AiILNvZ/Z3EQdNklpMdpBq9QPHkLumfWqNAXDpVyFj9oh9e8wux/Qclau9l+CaThE7H
 f8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788852616; x=1789457416;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fGPNIPCMK92NLMPG+emyq6u7k9/+jLH2qHU1vjFkODc=;
 b=Lj6rs4dCXjWsb6dbnqVSdlptkYdib+8UzO81krALRq4nJ+XBFBlCRQ8t3f41iqQsPS
 xjI+5ayQJO4tPbmVYGc2+zvlbzBJnQfHYsxsq3jAPvzvVKg3UgAz/7x/PSLJE4pRM79I
 rpO2tVm8AZQnjKCbHIxzybBFndK6iQrjv2FdDdMxIUA3iVbxXmwpLIbS1A2J6mTaRPOX
 CHRzSoAHXO7yzEEl6z8+2Iq8O6PzrpmZ0NY2fhJPhyfN00iVT/Asdm+n06YYF8yZBSc3
 88+G7u6BB4bvOnxe8BRmug0F4Czmydhapo5V5x3H5TvinpO7i3GV7hUq6poHP7/a65yj
 CzhA==
X-Forwarded-Encrypted: i=1;
 AKwUvByaexC3dJm3DIVQuZ5RC9V3y1F7CS47K0ylu5+Ouz6Y9gIF5l3+MgoOq77Vd1IH1rkB3SfkmySZ7Nfu@nongnu.org
X-Gm-Message-State: AFuF++msgDhE7w0QKZ46EqiUw2UKGvJkfCDWagwppC7+GtUymMcneS4C
 IxLPI1sPJ2JB9Wl7RGYY6R7omHLTBayGRIw8KiDAgZh6PC/wJENfcmD5R8I/TwZOduJYJHOxLSt
 3WYz8TnPcuzq7hxsVyqG497UCvLbswM8HCJPp94W4wUO4C8p1kZ4PmuTwdLLG48joPi+8PfkfmN
 +rF03+jnFLlAxFZ6h0s4KrekRa4hYQLNCs
X-Gm-Gg: AYBFou2LhtlFTvy4RJ5GN2ESVllcIoqlOaJblf7pSVBaZ6iiLjquBmG767IQRDXNcFP
 RWkIJyFzJPzbnknZ7mNjlnweZEOWnv2dPY6WAmRQo8sOqJQmzkLSfLTTRSfP6hTQBosv43NH/c7
 7GmkAJIuoZPMjqzJAGx3Rq8s10CsHMsbhB2wutAK73Z3CSQ11S9EETtt64oBY=
X-Received: by 2002:a53:ad49:0:b0:66f:c1be:3180 with SMTP id
 956f58d0204a3-66fc1be35c6mr4629655d50.87.1788852616422; 
 Tue, 08 Sep 2026 00:30:16 -0700 (PDT)
X-Received: by 2002:a53:ad49:0:b0:66f:c1be:3180 with SMTP id
 956f58d0204a3-66fc1be35c6mr4629643d50.87.1788852615909; Tue, 08 Sep 2026
 00:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260904195610.964829-3-daniel.barboza@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:00:04 +0530
X-Gm-Features: AcwNN1VELcYQOP9X8V8mWL2uM8w-8UdhC-a7O9RGwWDLuCYLY3e9f1fQTwoJsXI
Message-ID: <CAB19ukERmbJF+dTQ6kW1FFuhxPBAPLuw2aJQo2bvkwH+D5dF4A@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] target/riscv: add riscv-server-ref CPU
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, andrew.jones@oss.qualcomm.com,
 leif.lindholm@oss.qualcomm.com, Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DOgLnN2tyiAcbA5lvZ8Vv73k17GwRLu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX1N40ToRP3iPa
 O5tzqVFsRF2OBeEqhJbOcoKWZZDgQti2/9FDJNdLaqEIwLNB9Y2LFOrFHKilRsTYSUWFX5ABaw+
 2cZ0LQWu9aGttN05FrV8AJy3bSrAC0kJzRDjObJcdJvKV/ColbzfNgvwNdCL5EVv+2NlVhKvJJ1
 Tm60IZlFrisgbQqFrqf+CiGgUeahV740aVNhbdkicL6OPYw2Obn2O9AE+dqvfmnoa7bDI/mI+e/
 xgVUul0TrNukmuy5dYWDsm/EMQFvoGv1HcBhqZnWhswAwz/ab/Jy92nFAyhqFYPYLlgMosT8Xm5
 +E7JfyPxjVjbXUiulam+vPx5BaUjcX5asQz3TMhWTiGK1b2Yf1RZkEm3J2DEG4Ibuv3lCqR8f2q
 FBgWcQl4Jj9Db6I/mhGcgS2p4eCr2a4RjMp/D8e7TN92Sa7IPAJ336jp5B1szePUx4HZ2U9WzG7
 xPmojXUpKgrAcSwqyFg==
X-Proofpoint-GUID: DOgLnN2tyiAcbA5lvZ8Vv73k17GwRLu1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX5RXUQ7Sutrh+
 HH/9rJcZAE0PO+bXRxpkGmEmprneLQk81LMUMsw7b0uLBCh5vHYRnVLREu37bSJPpcAaHArlGMu
 vjhc5Ytjxpjd2SaTDpIxPylXmIIDXsE=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fb988 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8
 a=PXcuKL70AAAA:8 a=FRSEYCzRAAAA:8 a=j2afkqJCyIVXg8yJ22EA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=xVlTc564ipvMDusKsbsT:22 a=1qLaeP4TCVy2vqIEy19U:22
 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Sep 5, 2026 at 1:27=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The harts requirements of RISC-V server platform [1] require RVA23 ISA
> profile support and others.
>
> We're going for a profile-based implementation, instead of a regular CPU
> that can inherit RVA23, to allow future CPUs to use it internally as a
> starting base for their own extension sets.  There's also a new
> 'rvserver-ref-1.0' flag that can be used to set the extensions in the
> command line for other CPUs, which can be used for testing/debugging
> purposes.
>
> Note that for all intents and purposes "riscv-server-ref" is a regular
> CPU and no, we're not trying to set a precedent of calling the riscv
> server platform spec a profile.
>
> [1] defines in rule SEE_020 that we must support at least 11 debug
> triggers (4 for insn address, 4 for insn load/store, 1 for icount,
> one for int, one for excp).  We're going for the minimum.  If more
> triggers are needed users can set any trigger amount with:
>
> -cpu riscv-server-ref,trigger-count=3DN
>
> Note that N must be <=3D 128.
>
> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/serv=
er_platform_requirements.adoc
>
> Suggested-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

