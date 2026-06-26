Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E3CDE010
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 04:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcyOs-0004OR-Iu; Fri, 26 Jun 2026 00:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcyOo-0004Jp-3g
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 00:42:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcyOm-0002Nk-MG
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 00:42:41 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-697764213d6so894742a12.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 21:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782448959; cv=none;
 d=google.com; s=arc-20260327;
 b=N9QYGKk7JbueD2xxrGxrlaoOs1pSrsWowHvPrxw9TqhczKsZv7SaUfsfprPemC3Rqo
 R9879ho3e7cMcr4a+fA3fsNp/S86GmMgLmpZXkYFpU7lVMu85DebwNMg5j+QlSBw3yUx
 0A6ZBbZQ7/bW95xL9zc1/lLfSvREYckK2V3geWJoE0h1GwRxnm0QCGegol3ZJwX5KXPX
 XEQjcqHQIAQJg2UEGs9J8wa8mFQO/mhp4ri4X35jFiepurD5w5QEFnnEyrbmFAqmOar2
 KD+iDVpAxKN3/mANHtqW6cUJs/+sFG7pbNceNLRPjeDawTkbXzbm6mUvMmxR+NiOnbM6
 24MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YgUtXqNn5UCD0dFZ+zBsrLNWHo7j6OwA5fqXZ0ecAJU=;
 fh=Qmt2qHn2V1LCh9kfG1wWV1mQTkyDfzNR6rX9PC5OkJ8=;
 b=Se9i5ZKU+idrBR8GHPj/Nl7ZSwu5zvgYzBotvnoe0U85+XNPZNhm+tmN+dZW6rBatY
 kO79QHPNKmGR89gdAXmKbuE82hedyCyLzGqhnv0W7JNJ9Zv5lfdnMc+SnozboQ7E8Mko
 hhqa947yBPwm+xuTvq7v5bn3zL9RTmTcxgJJpwdZT7pAuSBBpzcfE5MyepWwyc1ZBF4G
 E9vUm/Bd8UkBYCekiF9E1EMephswE4VKxItsAThnN7/ggfCA/wsM+u9zykOAlnNvkDJx
 cGBBUOTTE36L6OVcNCqu+k+ptOEkH46SCTZX3Gymr6640p0jsGwCK7qGLyLUQ3xbjepq
 /n4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782448959; x=1783053759; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgUtXqNn5UCD0dFZ+zBsrLNWHo7j6OwA5fqXZ0ecAJU=;
 b=l/EcMb3O7FcNWADYEt0j8m+qmEYI1w0uUi1tJg0ts0fw96f6Ji03sSTfVdJ7Hnzvtq
 lCHLQvEE2Th97TXZudswgdPI5cYukeY8h3eTL+fsNWuNnOgnigA192Rw9eihI0n8KVgP
 lA7pVDQ8+XRK1l/P+8/ocVVC7OAUHDV33vHtibmdrnDVkqL7mN+joo86lE7dDAUFpvMV
 +Vs5HEkh9J5wSQIxv4p/Mw9t43in90fdHnaqhXjPUU3RMpiFgXdLfMNF3PsWr1s8htPZ
 EN7UE4hH14zZi/h+IzbYMIc8aW4v62TbaSWA/gKVxbtfAD7Rub9npGY2j+9/U/R3jYXV
 5l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782448959; x=1783053759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YgUtXqNn5UCD0dFZ+zBsrLNWHo7j6OwA5fqXZ0ecAJU=;
 b=SIKrFS6kuGg0UW2lu4dbdRY346ZBZLe8IWwiAK7cHW8t00L7Y/Dr8QKAXfuACi14KF
 C/LuaKaTfKZ7wfgx5hfDmWBPvUgF6SKUxSMTDX6DfmC7O3nT0F9P0c2XypulceCNioR/
 gOZTMPMD7vGIlycUe+c6cVSCbPFH9sqFJ7mkq0r3kbmLkNnkS3GaFyreR3e/HVpv0+7M
 8PFuQjdXrloCMOa0ruBMJyEo9SCZZIWGEUyCy6y4OUhHCMuvMiQMwYF46AfI3ei+XBW9
 LX+KdqqU69WXR+Nhm1n2rv09oVxij9YBrIv4W4663BjYG4R+GAqBZmc0j65CP6s3VDOy
 mbJw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1lQ0p0n73rS29J7LLmjjRFF/m8cryMKJ3WNE0V6n0wNlj4f5VCHSottiNmdl4MROEGp+KAt2nvtRn@nongnu.org
X-Gm-Message-State: AOJu0YwBkZFe7zaKhVdbCRhh3VMc9wyXNMQ5mxg2uD6rYGE+4pJOynkK
 ybMdp5PEBagBB6IvGL7Km0igjOkLf00If2Cx9aRuMBKhqruKEe1DTF2FtkIxozhU2GBsK9yzejT
 J3DW2Gz9mT5DeMKCGefWXQOfi6GpJ5RE=
X-Gm-Gg: AfdE7clGX61YpqKe99hN0NxsaWIQlevjkvwt75LiIgktrz0z8OQ0IzdkO9Huc0ttA0w
 kszHOUHclYN0L9k7nLynnG+gZqPvw701M3tuJ6aZeyMZPLHvCeZYaLntg9u/4fEWEu62ILLe/lT
 zJjzzI736VS5y34DdoYMwRcq15o2FPGUO3aFEAVm/LBvgvs7jq0I7kXXpmpZGsWG+3wuaWNLdYD
 lzkoz88ybQ5kMRyUkbV56G3XvzPNodOz/MnGY24U9fpFUFSDAdEh/p2vrXVXI+PPo0vh1Z2nqNj
 isroMqxcS2mMCBkoA7nucIE70JWh51ESy2zdCA==
X-Received: by 2002:a05:6402:254e:b0:697:ee73:386d with SMTP id
 4fb4d7f45d1cf-69810b60d79mr1130107a12.17.1782448958508; Thu, 25 Jun 2026
 21:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260625210833.3294437-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260625210833.3294437-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 14:42:11 +1000
X-Gm-Features: AVVi8CcTm76-40JVciQA92N6dGHHvc6Nnsl8teDObFsoLkQhja312ips0xMeMug
Message-ID: <CAKmqyKNNXAX4itYHg5fkeahHDBWJfEfJsYf8BU68x4oJ+rLm+Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/riscv/riscv-iommu: gitlab3576 fix
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Fri, Jun 26, 2026 at 7:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hi,
>
> Here's a somewhat trivial fix for gitlab3576.  Patch 1 is something I
> decided to send because I got misled by regs_rw.
>
>
> Daniel Henrique Barboza (2):
>   hw/riscv/riscv-iommu: rename regs_rw to regs
>   hw/riscv/riscv-iommu.c: make FCTL.BE read only 0

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/riscv-iommu-hpm.c |  4 ++--
>  hw/riscv/riscv-iommu.c     | 40 ++++++++++++++++++++------------------
>  hw/riscv/riscv-iommu.h     | 26 ++++++++++++++-----------
>  3 files changed, 38 insertions(+), 32 deletions(-)
>
> --
> 2.43.0
>
>

