Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3BC7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 18:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2FJi-0006JZ-IO; Thu, 25 May 2023 14:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2FJg-0006Im-UZ
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 14:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q2FJe-0003hN-7H
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 14:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685037837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MrQ7Ly8ydRcEmG5HGhzf9RmkfzNpCsLWiPiyF06IP4=;
 b=WnvvDs0mdbM7b1IrxQ4MnrfPIEBtfyTKzbNXJ2CAMXd7xgEdVCZjRPZDRNwUDxrPNmvVgR
 cTvZjhq/ka+Gbb8Qzg6/3aIpvWIm+PpJhnmFNVZD8Dh+hHqL36f06bqhnNuFXaZqnQnExg
 tj6gTjRjVR2KphuZGJ/r9g42oR7kJbE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-N0LQU-SaMGq7MwmmbEyZmg-1; Thu, 25 May 2023 14:03:55 -0400
X-MC-Unique: N0LQU-SaMGq7MwmmbEyZmg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-530277cf88bso1751067a12.3
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 11:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685037835; x=1687629835;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MrQ7Ly8ydRcEmG5HGhzf9RmkfzNpCsLWiPiyF06IP4=;
 b=OxPzqxqVZqSrPWmGVxgPBFRAAbSW1fMdvwRKC3+Azd9kADnSrGrFg7NOu1ejc4cOat
 pasfNuq0M2POUNJYJ+8sLXJHqq92Il7YHaVle/q+OKGnJdU4oD6ORYzriZlBvNrabfyj
 pHIMGKwoFT6v0I50qRXzYMeTYTO9WENbhb7YGXd+i6FhW15nZzrAdOEPZip3Dv3Bn2HO
 aiJOzoOnoJMpQXpfs2WVKAk10sOwkCCumKqZGd/SW5dnMenIUtYunyFvmUuHxyf+xVkT
 n8J+htMrSMcpwsRTLJkK7P344zK1L1f7LdbNGFYCjBe5XuJHI/Ff/meATlSGSKQ2AbZO
 ISqw==
X-Gm-Message-State: AC+VfDwK0ZEyZ4oK9vp1N7xBcCWjkzEk8E3fPphW1vI/0gLQLpvZIbQO
 sS/wQc5ui0iFpw90ArTSRJFIYscgLoIq7heIHgGXQPtbGvU/Vqmprc5a3n4I0EU9SVGq4c/M/aU
 Dxopq2fwg8mH/MmKvbhF3RmZyoiPUWqY=
X-Received: by 2002:a17:902:e744:b0:1af:a349:3f0d with SMTP id
 p4-20020a170902e74400b001afa3493f0dmr3693592plf.23.1685037834731; 
 Thu, 25 May 2023 11:03:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6N5qYptIWtLuic3WKt0OpVe4rvrx2Dce/IEDGXXCVnZU/Fvh4ZwAe7Tw7KLiBZ7JG+CfyIzoy2YX3FLOKAWXM=
X-Received: by 2002:a17:902:e744:b0:1af:a349:3f0d with SMTP id
 p4-20020a170902e74400b001afa3493f0dmr3693545plf.23.1685037834196; Thu, 25 May
 2023 11:03:54 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 May 2023 11:03:52 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230525164803.17992-1-sunilvl@ventanamicro.com>
Date: Thu, 25 May 2023 11:03:52 -0700
Message-ID: <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000008a82f205fc8871ee"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008a82f205fc8871ee
Content-Type: text/plain; charset="UTF-8"

On Thu, May 25, 2023 at 10:18:00PM +0530, Sunil V L wrote:
> This series improves the pflash usage in RISC-V virt machine with solutions to
> below issues.
>
> 1) Currently the first pflash is reserved for ROM/M-mode firmware code. But S-mode
> payload firmware like EDK2 need both pflash devices to have separate code and variable
> store so that OS distros can keep the FW code as read-only.
>
> The issue is reported at
> https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6
>
> 2) The latest way of using pflash devices in other architectures and libvirt
> is by using -blockdev and machine options. However, currently this method is
> not working in RISC-V.
>
> With above issues fixed, added documentation on how to use pflash devices
> in RISC-V virt machine.
>
> This patch series is based on Alistair's riscv-to-apply.next branch.
>
> Changes since v3:
> 	1) Converted single patch to a series with a cover letter since there are
> 	   multiple patches now.
> 	2) Added a new patch to enable pflash usage via -blockdev option.
> 	3) Separated the documentation change into new patch and updated the
> 	   documentation to mention only -blockdev option which seems to be the
> 	   recommended way of using pflash.

Success! \o/

With these patches applied, libvirt built from the master branch,
edk2 built from your branch and a JSON firmware descriptor for it
installed (attached), it's finally possible to boot an unmodified
openSUSE Tumbleweed RISC-V disk image by simply including

  <os firmware='efi'>

in the domain XML, which is the same experience you'd have with
x86_64 or aarch64. That's a *massive* leap forward when it comes
to giving developers convenient access to a reasonable RISC-V
environment they can play around with!

Thanks a lot for your work on this, and I can't wait to see it
all merged :)


Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization

--0000000000008a82f205fc8871ee
Content-Type: application/json; name="50-edk2-riscv64-raw.json"
Content-Disposition: attachment; filename="50-edk2-riscv64-raw.json"
Content-Transfer-Encoding: base64
X-Attachment-Id: c666e742d99dd9da_0.1

IyAvdXNyL3NoYXJlL3FlbXUvZmlybXdhcmUvNTAtZWRrMi1yaXNjdjY0LXJhdy5qc29uIAp7CiAg
ICAiaW50ZXJmYWNlLXR5cGVzIjogWwogICAgICAgICJ1ZWZpIgogICAgXSwKICAgICJtYXBwaW5n
IjogewogICAgICAgICJkZXZpY2UiOiAiZmxhc2giLAogICAgICAgICJleGVjdXRhYmxlIjogewog
ICAgICAgICAgICAiZmlsZW5hbWUiOiAiL3Vzci9zaGFyZS9lZGsyL3Jpc2N2L1JJU0NWX1ZJUlRf
Q09ERS5yYXciLAogICAgICAgICAgICAiZm9ybWF0IjogInJhdyIKICAgICAgICB9LAogICAgICAg
ICJudnJhbS10ZW1wbGF0ZSI6IHsKICAgICAgICAgICAgImZpbGVuYW1lIjogIi91c3Ivc2hhcmUv
ZWRrMi9yaXNjdi9SSVNDVl9WSVJUX1ZBUlMucmF3IiwKICAgICAgICAgICAgImZvcm1hdCI6ICJy
YXciCiAgICAgICAgfQogICAgfSwKICAgICJ0YXJnZXRzIjogWwogICAgICAgIHsKICAgICAgICAg
ICAgImFyY2hpdGVjdHVyZSI6ICJyaXNjdjY0IiwKICAgICAgICAgICAgIm1hY2hpbmVzIjogWwog
ICAgICAgICAgICAgICAgInZpcnQiCiAgICAgICAgICAgIF0KICAgICAgICB9CiAgICBdLAogICAg
ImZlYXR1cmVzIjogWwogICAgXQp9Cg==
--0000000000008a82f205fc8871ee--


