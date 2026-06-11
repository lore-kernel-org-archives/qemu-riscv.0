Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07239CD98C7
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 17:54:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXjbY-0000xA-IC; Thu, 11 Jun 2026 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wXjbW-0000x1-L0
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 13:54:10 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wXjbU-00017E-OD
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 13:54:10 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7e1916922b9so1770717b3.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 10:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781200446; cv=none;
 d=google.com; s=arc-20240605;
 b=FqG7GNi2LYF1kWnr030jmmW6Mek6pXDuVgtl0Wjpfvr+358upYEk2JKl2hvJSJ6qBF
 JuEK37cE7iRSMz4414iWbmTKXtxnf8e2fUeaHdfPTlbwBb+bsRx+qQmHEUYPUADysWS0
 xmfAY5pe/eT+MtOxA9gc42CDreAeZ/uj3luQDFxEbwjHSYRSOBOu0is87SUUKYK4PzYv
 YyVxGCFtHdO4gIw8ysTQM3OHTW04cUS1METM1A88Qiabhva/nttkIKb6BVxDEVOQejat
 szZNDNNJrDbQvu9mq8EkUYX5zSBFRm1uL6k82C7znEspV+/X6Y4B1CXZ6kDKc7S3gHOD
 iwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4S+kilPYjPcva7ux+L+oJoTq8vBmtTVcQ+B39E3yucE=;
 fh=3BdBT6ztoodw5cr6Y8mbMYAsz5K3IesckJnuVh7tZXw=;
 b=H8U40mC4b8/EburjWtez6EbkURhvL8kzDESH4ezMW3QEIXWGxZAzgF2GpHy5pUXjLP
 BBV30sutk1/mot3MuzPEFFlhDerL1R+k2ghyY21Fai5lRcb52QKscjfcj8JNHhhmdC6i
 z1EQUi9FmiCm3YDSJqh5nHXJ7PxCCHHVp8KpP5gzPauQALadPVfwhM2c/LwVfV9ZZqC3
 rdzcrL66s88NOP9GBFNQOFAL+bR/ACg3LdsajCAoK4M/IPs+/rykqlkWiN+2E0cKxHHz
 F4hb0k7LONuWjQ5gPL5qg3r62dJIyQ7YTubnNdpexESmCXh5B6f8TE9YfHHfntr08qNp
 9YCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1781200446; x=1781805246;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4S+kilPYjPcva7ux+L+oJoTq8vBmtTVcQ+B39E3yucE=;
 b=ymywDYNhI5jyqNV2GGEYl9WgCwmvMZyLmfl6f/DkKo7nSZFA8m/Pw21vIA8sUG6b+M
 24NeqRQvvC3ww7q5OgztDyrHDw2iCCETpcj8wSZc9UiOS9m0SLArVgNzFJRqpHSovWhI
 G/Sl0UtmrsIv8w9hzlFveEtqK2Ir3FMPFdzAKnzV4HHcpwfKMnlDz7ruNrCmHmOamfxM
 Y5S/KHYxOFSJYY22FJAGQ8xMTJiHmg5+IVCdyPrXDuFg7m19m7NzamStUruBio+zk9Y3
 +1z0jp/VQ3amGuxoIq/NUKaSZKHTNGMYM20DocfHJ36BIau8mH2fqvs/pmkrlI1P2L5I
 EpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781200446; x=1781805246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4S+kilPYjPcva7ux+L+oJoTq8vBmtTVcQ+B39E3yucE=;
 b=TDkZlDr23ZQr3Jh5Ja5TA1f7lWR5StLIqjPqXNLmvCGyzBH04HFERqdtffGeKpfNdR
 bLiOObSjDroyq9ivb5+B9OKCDktt9nLU5HbIgZJxhBdw5qZIz/VZLfxI6RmqTTV03A7y
 3y4OVY4ZxgELqtGmXs1RLAmAuzN7JoVXwmhb7OtUsgrICm1DQOSf8tHl7+0TGD5N/RBD
 nyMw28eymGvQQ8aWbnLh3HzB3r+tz3XCHDoIwktM4Ew+KZXkugQNP9eGd3jOauZG17T7
 S8acvOP8JbNEbdIObtwZZxMvK0TmMWkLAGcB+Z1Aezs34LqgRtrpi3Fi9HAU1E0MDXgX
 f6ew==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dIxe8uFAnkuNA6c74+yETXABV/pwvDOvBH0XY9eBLyMfKOs31jqwvN0CJuGmsDFgRWdVpcsHdEXFb@nongnu.org
X-Gm-Message-State: AOJu0Yx0TRZY+8kfSL/+dqymoPAkHkqncyF3ZwCCoLYCIoPP4BwWQh/z
 KOonW3WX4DFkM9Q/NQVCrzg3oExYXVYZXvF+sz5CJvLI+d4cikxP94ebCHUKjCtRj6ggHPUBSb0
 FoI1v70AIoxkJrLth4LrpCmyfnMsesq2OSDJlDppy4g==
X-Gm-Gg: Acq92OFvsIxgg6yq+LvKzamrOrf3D2YJi82OWoDrZCIqJzi1YCtSbp0nqmFn1rcjZC0
 MvZHUu6von1UocsFHI8hbXqgWaBpOQKVPGNDkc4fNsnzC5tyyvQRtZmRxDaQMjw3TdIFYzuKwkS
 JPHd4lxJIP+U4ek0CEPzdX9i84x7msMCFToeNs3ioy4wXNNpiJ/drnHahmhPmqiq4sPMnYhjGuA
 j0OqkfSFlci00PdE/imPUfP/PfNSbx4XZkOn25F/n0FMc1T/9dV9YNdZXhvvUz7oVeXfsaStus8
 Dw7odEB9AQ==
X-Received: by 2002:a05:690c:6188:b0:7bd:9ce7:164c with SMTP id
 00721157ae682-7f658707f69mr42294587b3.43.1781200445549; Thu, 11 Jun 2026
 10:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
In-Reply-To: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 11 Jun 2026 10:53:54 -0700
X-Gm-Features: AVVi8CdKiBGwYyHaMah_j2ReXddn16IV6Tr64RHdWhYraV4L8ovSWSySxnM5QqA
Message-ID: <CANs6eM=nBQO-dpY6ib0qdfihJUPcYmM3xAhkqV6_6d_jsX5K9Q@mail.gmail.com>
Subject: Re: Regular QEMU RISC-V Call
To: Alistair <alistair@alistair23.me>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 qemu-riscv@nongnu.org, max.chou@sifive.com, mikey@neuling.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=palmer@dabbelt.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Jun 10, 2026 at 9:23=E2=80=AFPM Alistair <alistair@alistair23.me> w=
rote:
>
> Hello everyone,
>
> As we discussed last time we should setup a reoccurring meeting for QEMU =
RISC-V. The current plan is to start next week and then occur once every mo=
nth.
>
> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10=
). Hopefully that works ok for everyone. If it doesn't let me know and we m=
ight be able to move it around.

IIUC that's Tuesday 5pm Pacific.  I'm pretty terrible with time zones,
so I just made a calendar event and it should be accessible here:
https://calendar.google.com/calendar/u/0?cid=3DY183NGQxMTNlNjRmZGYyMmU5OGQy=
MjkwZjMxYzY2MzRiMWY2OTg2YWJlOWVmNDRiYmM2MjQ2YWU3ZTI5NTliYmMxQGdyb3VwLmNhbGV=
uZGFyLmdvb2dsZS5jb20

>
> If anyone has anything they want to discuss let me know. I can send an ag=
enda and confirmed meeting time out in a few days.
>
> Alistair
>

