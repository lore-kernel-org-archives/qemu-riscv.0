Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB1CD98D2
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKbO-0006x9-4t; Mon, 15 Jun 2026 23:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKbG-0006wh-E0
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:36:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKbE-0007JJ-Ju
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:36:30 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-68d234218bcso7320264a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781580987; cv=none;
 d=google.com; s=arc-20240605;
 b=i4ZbFxvSRL346tfxCmHU/4nA+at+/O1s5PCboAkFN6ORq0EmTyhy4/pl2tshfNtDjG
 9UxzvmXIfS5Q0eXNswBD4fItDQ3Da5kXfo+95+cTcXm7ua3EFUKx97hqIMJ518NmxUL6
 A308wgrwL5s7o36FsgSvJk9WOdTeS5KAwMv5GBOlkLsLPHi4mjWg4Dxl2epLEFktyT7G
 DyL8JfNBdXqsML0O181OR9TkxoX2f/l1TfjeJZkjazaOMbZTSoVjHo2xDpvlDnmCadGl
 Rl3iLi7J4OjILzY1lf7Cxh//yWkXTkVIaFYt0yFoZnvp6KweTzCPO9apke5VbCRqwAPe
 yvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PYdHyauYmderA8Rp9+txY9RPFdvtmdE57KgE5PnKn0g=;
 fh=zZ0shXqyXVR5sNrDIUVFks3krHp79gtn/8vXdH5mKdM=;
 b=ahU16txlt18Zt4rUv/euKj8Qp1xFJ6Tlftis3lqz7jLQqo+N9iDHYh1UMDxIBItCFm
 amu0BlHDxj0bYhPIGe/rmfWw/BTTkE2wEu1bhZaIB5L3O+jE0oISjlHqGoLveD4GyWqg
 XtZiXvAJYBHBYYakruDAVeA/ehlnkMOFZAGvvTtFxLyleDGx+V+ty3mEjFAEI1v/4ijq
 z1b3FRiUKFRWvHs0nbDvUNnR7KsiP08WWRyzpN59wS3D7bMZfgYn2RM3NX71TI4aTHcP
 pYY/jDqZh5ozxXZgzUeAoijkPcrIJ/rRLoKQ3i5/uiO0O9l383uy3xvd9XJ4lg3X3YtD
 KH2A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781580987; x=1782185787; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYdHyauYmderA8Rp9+txY9RPFdvtmdE57KgE5PnKn0g=;
 b=lrLhVvSGvvASdCV6R8O5sgiNhd4fpR2UTP4U2eJLjody4//6bTY1SCatyPSDreqDEi
 IGe+u+fqxK+06meep68q1M60m55ekuLfx5XXEysEueqPnyB4CO8ADyY6Ys23DC+H1VWN
 7VvAY2+5v/XPK7M5/GKoA+8RwoY3bk95BvdWRT9jB8WCDJ2t1EGaejOht/WHihC7TyCG
 TXBxuEE8XjB8z8ThMvtvHPRmXV63YN0DPepTJg1pcHWHon4Ya6EnTs/vCE4jBHoQp440
 mixceh/izeFzy/K5oTSgaQDvWR82SEs57cb9w4RouvAcknWIIEtVTL2JYJHmrBQgK3qP
 fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781580987; x=1782185787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PYdHyauYmderA8Rp9+txY9RPFdvtmdE57KgE5PnKn0g=;
 b=s5aI8B5YrTnTk5yjqQJ2HKppnfK69t9tvhdw5utr+lQv2AHj3lW791QnmZpaeVCrJw
 fC4LWi7lYNblzXgVvmo+OXlnkBPc0ArM97d5Uaic+deOpH0b1uvSDh9tOrfNwZ/Ne4Hi
 IuUrcU9NtEiUE65f6//UxmMRpmYNzMg6vemSZ5nHsE2aThKx33D0YipFsGL041o92BZJ
 mXJB4R/mxMTUc7RxDZHCZ69pqdi1DQHDtCxJOO0G8cLzWcovKCT8LDJGTtqW4UYpu+Ey
 cSAR045Ofx8P6wHEpC/vA46LbKe9o7jg1oK1Cy6v2sEYubsKOTlkaxUj0KVXhbFxflt5
 l/iA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HJGoBuDCb+393beXdQ0MoXupkFMY2ks3ErTuwib79zQEYKsg9aeENozPm1RZa/QVU+ec1Rs6LQ6yf@nongnu.org
X-Gm-Message-State: AOJu0Yx5l63SWHgmYawA4mYUEHgFr65ym0Nn4HrE0BFbnslAUUR55FPR
 Je+eDpDu4NMEevJi9AR1wn5IJVMcp3m5Fe/eiwBEG1PvAWXnijFi0A5GqD4001dF96xsqZVys+6
 tZLLHVPq/OApCEqYQ9Ske3ZKjS9AZ3Bk=
X-Gm-Gg: Acq92OFMPNmxqL9Og5FKCve/KjL/0TUw33jFHxsr8WQXCPyrLtf3v/ACLRU9EltPWLJ
 4lxLSLMsEKnDAKxPOXxYlR1yZG9trw5oi0o0nYE4mIFlq7Ks6MS1flKzzVyJcAwL5j4GIFvmqF3
 kzf2hLSTb0KgTsPLdayy/FwHU0Yko0kxP4enDwVUrLfmv+8PWw5eIGyxoXa/uWSjQJ+xhshArXN
 ct9NttKUOpuLhxnaVGh5wZ5sIwouJlr/Yq29B/VxY+C5QYFtiFPOvnTAFEAWsHMtOrBJiHDyZYI
 i2YJbABSK7wBPyO7WK7aPBuBtHKBLi0ysMCFpRiJqN35vmsF
X-Received: by 2002:a05:6402:a50a:10b0:694:faab:5454 with SMTP id
 4fb4d7f45d1cf-694faab549emr964287a12.19.1781580986624; Mon, 15 Jun 2026
 20:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:36:00 +1000
X-Gm-Features: AVVi8Ccpl3BIHKowEduWCyOi17Wd-mhaPsvn-pNMM6VA6hUJAe7I034cYy6FvnI
Message-ID: <CAKmqyKOD4G5u==kr7ueyHAk-RpoqPPrefMou8_OxUbZ_go5b0A@mail.gmail.com>
Subject: Re: [PATCH 00/13] hw/riscv: FDT creation helpers
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Portia Stephens <portias@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Jun 16, 2026 at 6:43=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Salutations,
>
>
> We have a good amount of code repetition between boards, mostly because
> we copied/pasted components from one to the other across the years.  But
> now we want to upstream the RISC-V Server Platform, currently at v8 [1],
> and this topic came in the review.  This is a work I've been ducking for
> 2 years now but seems like it's time we do something about it.
>
> The patches are mostly code moving work with some design decisions
> here and there in the new helper file.  When needed I changed board code
> first to be compatible with what would be the helper (usually the code
> from 'virt', which is more modern) and then I moved stuff to a helper.
>
> The result of this series in the FDTs:
>
> - for 'virt': no changes;
> - for 'spike': the /htif node changed places with /soc;
> - for 'sifive_u': phandles values for cpu-intc changed because now we're
>   generating them (see patch 1).  Aside from that the board now has a
>   'cpu-map' subnode with cluster and core IDs;
>
>
> This is not everything -  I have a shorter follow up FDT  series ready
> to go as soon as we get this accepted.  Figured that 13 patches is
> enough for one go.
>
>
> Patches based on alistair/riscv-to-apply.next.
>
>
> [1] https://lore.kernel.org/qemu-devel/20260610214133.1882563-1-daniel.ba=
rboza@oss.qualcomm.com/
>
> Daniel Henrique Barboza (13):
>   hw/riscv/sifive_u.c: add a FDT phandle to cpu-intc
>   hw/riscv: add fdt-common helper
>   hw/riscv/numa: make numa_enabled() public
>   hw/riscv: add create_fdt_socket_memory() helper
>   hw/riscv/sifive_u.c: add intc_phandles array
>   hw/riscv/spike.c: add intc_phandles array
>   hw/riscv: add create_fdt_clint() helper
>   hw/riscv/sifive_u.c: add cpu-map, cluster and core DTs
>   hw/riscv: add fdt_create_cpu_socket_subnode() helper
>   hw/riscv: add create_fdt_socket_cpus()
>   hw/riscv/spike.c: use create_fdt_socket_cpus()
>   hw/riscv/fdt_common.c: create create_fdt_socket_cpu_internal()
>   hw/riscv: add create_fdt_socket_cpu_sifive()

Thanks!

Applied to riscv-to-apply.next

@Joel Stanley , @Nicholas Piggin , @Portia Stephens FYI

Alistair

>
>  hw/riscv/fdt-common.c         | 202 ++++++++++++++++++++++++++++++++++
>  hw/riscv/meson.build          |   1 +
>  hw/riscv/numa.c               |  20 ++--
>  hw/riscv/sifive_u.c           |  88 ++++-----------
>  hw/riscv/spike.c              | 123 ++++-----------------
>  hw/riscv/virt.c               | 182 +++++-------------------------
>  include/hw/riscv/fdt-common.h |  33 ++++++
>  include/hw/riscv/numa.h       |   8 ++
>  8 files changed, 322 insertions(+), 335 deletions(-)
>  create mode 100644 hw/riscv/fdt-common.c
>  create mode 100644 include/hw/riscv/fdt-common.h
>
> --
> 2.43.0
>
>

