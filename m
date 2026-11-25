Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E929C606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=WCMRmA07
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW3Am-0007d2-PO; Tue, 24 Nov 2026 21:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW3Aa-0007aU-DY
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:55:43 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW3AS-0006NV-Jc
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:55:35 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-67da69e7c31so5651914d50.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795575331; cv=none;
 d=google.com; s=arc-20260327;
 b=BHxsBrAgmQc0XYGEXCUUmA79vsP7f7JP2bOAaM3oLx48FHxfYIjkqQG1ae3lCoKDDN
 nxznyN6W3bNxa0V15X5rF51v/zL8opoFUClr2PXoR8zizvnZtsiPyPCVMiTFPNvDmVyz
 Ixzb+fPCpAmXiL8Oir4dinw+H2QoGqzg8nX09KQcQMQSSHXsJLGGbrDbgs8dYRTFr2Z3
 jhu9ovLYvl3/PJlnqqJXhoyvUuHOGPO12vtISGL0dUDSClXrUOyKO17ZCVR7BmsnH857
 0J9dt8HMp4jjTfGsJ8UVysW9HfNPJsCX3B++K0kF7qXBXghEGD3U5hYDBArNW2AEsZCh
 SKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EDkDoLY7enX9HQAphRJxJSyDbogIPhHutrgYfaQZ5PA=;
 fh=NgacZn/T0D3sF04POaTHbYxoXO/NBgWpUUoTWtOk7x4=;
 b=X6AGBAmlz3f83elEnZSQoLJN+c80rnXwLrmm5gHTgI3IJ6NsdGyAYMbK14heGpAxyg
 P+JdfoQ1alenrCr8FFlibiHo6VTsPV9J5ulk8/sspWJseGuCzXtcTymTM3RYPGXlzAzT
 1PRx9xFqQ/KeEzXn7R245paUkmd/LoywLis/Q7PNfjHcJbdF3ibQJVVnRkWpiydQuBs2
 rLCRuUApWSz9p0TsIjuC3S6dLUN0mtIsw9XRYTODBZHE5e9jdmrv2W0C+x7OhtZ3d9Xu
 EPe3YYcWnTxAOAqjK1R7QmRcZXDInpejcWxNFSnjICA6DlvPHRzCX5Kuh1MzPpa+8sAF
 UnqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795575331; x=1796180131; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EDkDoLY7enX9HQAphRJxJSyDbogIPhHutrgYfaQZ5PA=;
 b=WCMRmA076lKuaWr7htH7ju+YZsv0A5SR/TOt013Hlxb9+yUAZNMPI92cIONEhC0anl
 rtME0ytD3yd+QVkcFmtyy31r8PZZg0ubZFyYDB052+jP/o7/e2DkUhnNJTiFABgCwwgY
 tRIoDG2EleaGMbvlql9kEUVrkSrMxNhbkA9TLtI0VMVzi4C7uFMr0iv9PqgGLheT5ynh
 y1a6XoKNUAHX0wayZdEPIxaWWXR0UUGuvYjfOmJ4U1nnJldoqRoQfouSQPJi08hKKfmU
 iuJ+U36xb9jJG5CG2PYYZHDC+0b0I7R48ylQis1//et9EFBn7yt108BEeJJHwY/pBMgw
 NAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795575331; x=1796180131;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EDkDoLY7enX9HQAphRJxJSyDbogIPhHutrgYfaQZ5PA=;
 b=Qsy7Ddk3bcawChzojssKIcvWoFugjIiO2o/2xqVM/BkdSM4gVDygTGl03IdFVur/db
 87cY74caqEA0jvvYqQYYuk/wbRrYgGhqxqVZ+r4vxb8sr7HLgHq7HRyYxI5Ce1hDW4/+
 7ZDKKro5+aU43g0EOjE/98Fleg1ydmL90W0EVXGa1ODQNNQrXGT/D1al5dSCna9IESvG
 0MgrgWIhecMcIVFFCWuqaDZAOtwr+rZjrgf0RCK1zm1JKJIl6q+HvhMT0HXqbqiacz/L
 FT7kj6r9W/crlE1lpYf7eGYQUmksSMSnWpQA2OkQzfJmvwoTyC6unzX9oCQwn6Pne+0L
 NYOw==
X-Forwarded-Encrypted: i=1;
 AL+hErF+/ufc0/PoSaMDInr6fWKn+B8tkCw6Up/Ccr8GCVdBgjRNa5aovsuQKjSBMGUuZJxOhIIcaM7rNuEe@nongnu.org
X-Gm-Message-State: APuU4Z8lhJza16K3E6banVaHqP5W50hN+weFLxUvHOeF+MtmE5TvAQdB
 n85RvXCpzMBArYczfR579pKZZNWOexJXUXSVfn8hzdRa4ISCbXkJQVV9+XzuOgXK6vQnlvJpxVU
 SoBBdBYkSqxkxj4o82jbneuJEWnrrNH2QrFeZP+w7wA==
X-Gm-Gg: AZFdTZc9koVc0w7fpigcDOtyzFmUBjy1emCamAnRODWrq2BgdA5WmhI6rZPKWxkOcjN
 U7zu7EkypKx/bL9m9Ax1nF/Mtzyx/w8RXK7bZnINSN9/laq2qmc6bIP+NyZeBRvpT1N5/1VeHZg
 YBRqcjjSVL1jTLcWTAWIgRjUhY7bIpucm93R3mgiWkuL8c0HVtZYmNgxXPRCW5HJ4L3rZcA0m4y
 T66MQVqP+zTB/6lSP1lt+IxnhTvlo1kaF0gKfkFj+WjWDc1w67t6YbnqpHEj8vvWGAPwiLzCiNO
 /UHxKDu7gfn7MA7mEpENZ+WHkbxGa83TdeollEN46pVlkkVwccsQZFEMr/0glBJZ6ol4AGijTID
 Z6d29rE533CXLKGYKnTcvWVyd4ruTI6blYIoqtoIKecpxb3H8Nj7OphtJbJIms98D7yqSYafmQX
 vprD9thbo5VitCBs3fQHefdKJr8Q==
X-Received: by 2002:a05:690e:4813:b0:67d:ea5e:e504 with SMTP id
 956f58d0204a3-67df45054ffmr3967328d50.103.1795575331128; Tue, 24 Nov 2026
 18:55:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
In-Reply-To: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 24 Nov 2026 20:55:19 -0600
X-Gm-Features: Aa3M54qvOH8NH_QRD2cbPryqZOmekonp2z1F3IqO4lKN69uJgtkrPOpFKeQ9okk
Message-ID: <CAEev2e_4A9sU_SC5_R6zz6+08TPZJQ1YxH0Npo9D7+NxCxf9zw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add Spacemit K3 Machine
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Jeuk Kim <jeuk20.kim@samsung.com>, Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 8:37=E2=80=AFPM Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> This series adds a spacemit-k3 machine to QEMU. The main intended usage
> of this machine is for firmware develeopment. This series models 8 X100
> harts, has SMP support, uart output, minimal implementation of syscons/
> clock controllers needed to boot, 4 types of boot media (SPI NOR, SD
> EMMC, UFS) and boot mode selection.
>
> The machine allows the user to boot with the bootrom dumped from real
> spacemit k3 hardware. If the user doesn't supply this, QEMU emulates the
> bootrom and loads the next stage from boot media in the same manner in
> which the bootrom would.
>
> SMP support was somewhat complicated to implement because the K3 doesn't
> have one clear way to do so. A single hart is released at reset, and the
> remaining can be woken up by M-mode IPIs or writes to a wakeup register.
> One of the syscons applies an overlay over the M-IMSIC to intercept IPIs
> while in reset and wake up the non-boot harts.
>
> If there are better ways to implement the bootrom emultion/boot media
> loading and the SMP support patch, please let me know.
>
> The model does not implement the 8 A100 harts, the Realtime CPU,
> I2C, PCIe, networking.
>
> This series[1] is needed for the SPI controller to work in EDK2
> properly.
>
> A sample boot log is here[2].
>
> [1] https://lore.kernel.org/qemu-devel/20261123-m25p80_write_enable_fix-v=
2-0-0ac94f99e91f@oss.tenstorrent.com/
> [2] https://gist.github.com/asrinivasanTT/77e692e00d305051533c828fbb2d1ec=
c
>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

I realize that I haven't included any tests to boot this machine.

Since this machine boots from SD/Nor Images and goes through the
entire firmware boot flow, we cannot directly boot linux/opensbi like
the other machines.

Maybe a simple test would be to have a simple M-mode program that
exercises the UART and SMP, host it on my github, and fetch builds
from there for the test?

