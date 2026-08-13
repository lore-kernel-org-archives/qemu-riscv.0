Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF52C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:20:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuSY5-00048Y-Eh; Thu, 13 Aug 2026 06:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wuSY4-00048G-FS
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:20:32 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wuSY2-0004uB-Uw
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:20:32 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-669944f60b3so2138638d50.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 03:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786616429; cv=none;
 d=google.com; s=arc-20260327;
 b=ccQXU2NtkQdQQomW88M5WPawMxloyHv/qFJbY9b890w9uHjyMvZ8CupBXL8fHG6CQ1
 Tqq3hcXVyzYO8N9v5eRZq89TkCROWjSEDjE6vyLtou5SnrEYlRBdqATB8Mgl2m6Hfs0n
 /fzcwgybotdf2WQJwXXI3M0jTdb5grnGPd1Rr2WQMyCUkvePtp8+R/J7DXTpaT5BS9gc
 5+cy9Ha/YIgTqAwrYknbLv9i1Cwqi2eQCXciiO8LCp8CoYZHHBmqthhO+q/Xk6x/aLYb
 xe2kZk3fNQ9qEUATkH5A1YKo0it8Dz5b8tBkODiE3rIhgidW2TKwuKyGn5OsUcfXho2s
 qhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2KJ9zAe7qCB3LtGaL4rohPUD7uiks0q+L7rs3t64H4Q=;
 fh=OtY4pFmjItBDfpAy5V4RZXQitHkWh4VDEqXmJU6Gd44=;
 b=UUJiUMe0CHlCCh2TVtFI1W59H3k7klUUZnqiDivPZWBoDaaD8PihXGEujbt62N8w3H
 Yw04p7V+/HlrRa+fdsM9cjgtGRlZolnYqUXySF7bfZFO7F2MnUL9whj+3LqeyPnluNo1
 3JsTKgjZrKWHQiDBeBo3i/g/vJdtvSbeB7yYprkq11nWzGX1WMe/vXUTXD5ChpnLRGy+
 nYfqfHzJrxdS17kW+WWByXzHgfZm8fIsndb9F7O5crrA6njzF8Dkpwynk45fk9jxAqkD
 ZIaScxJwtnH31TU/eKDq1O0QLAbId4+bjy21DyR3nHcnuL8EEwMQPoxJ913pgbzCG/b+
 BPXA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1786616429; x=1787221229; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2KJ9zAe7qCB3LtGaL4rohPUD7uiks0q+L7rs3t64H4Q=;
 b=iblVl3ggEaGyCUQB5uduliLtwCmZC8FLgGJa5VNo+LKYYrAFstl+ywcAQ/ts4bivQe
 Twct1lOa2LYAZZqUVLN9dPGhwVU3IyoQ3JuyrGabBr4k7e6aOk/ab5QdI1LRdVLgo8+l
 6i6ypyhzj+dKW9qxPssrJuTBG0w7ehheho0I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786616429; x=1787221229;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2KJ9zAe7qCB3LtGaL4rohPUD7uiks0q+L7rs3t64H4Q=;
 b=AAqWuvnht/5UkPD62sE3L5tqMMnjN5DFqKQewdLL4SErJ2bTiIAlU+NnflsIX4ZXhX
 qeXC3ykP2JJzii/jIKhbM07VQOTmDo7a720CjTmi8E1i6FM36SbKkQ285alTj8kcwtXx
 0+cQihpVH1mvb1uQi6A7BQ9lxkF4KKUGxjeEjVsujIZpAV4oPYDo/eU3MIklsp6rOGNx
 EexRfnrejbtAdlDuG7YyYunWad6FIh5x1NGiqZqBO+KUWQgIoN+ObH8yiUuWHdG4ySu3
 aBL/jQisr4hQgmGt/feRoiHiHHAN9xL6iV2yv2BGVM5m7adcy27Oaq+tcWEHOM14PzOD
 g4Og==
X-Forwarded-Encrypted: i=1;
 AHgh+RowrD8nxi4HS2XCub0uI1T1AjQKwheP395QOs8KVHdZ5WlQbzO/x0EWsTGzeznF2KOohbjRl9ks+dty@nongnu.org
X-Gm-Message-State: AOJu0YzrtM9VYY3zbFf/pihWfZYrs5FaTbi+Y5HUgM6h1GypmlmoEtOV
 7P6qUtqMU3dZMvcLPlkfeyKz9Pr6UNt9wD5VxpX6+R/oalpATxdIJUIHrF6KQn4xTxgfj8SbyTy
 dLPQdWUI1ZlIvou26lpYeMou0snRkROo=
X-Gm-Gg: AR+sD11S/SwpkfGV79YMa1gna6xnf9DSAEWiOhUCmG8MekV4JZuY7s0FCbgr+2aD2cW
 GiRVrCHOdceUqgNWco2FHktnWLvuozKMlpLabaB0TmmCn7jdAAInmV27ju8qWs/ZyoeRZZKZoxz
 spuf9Rzs/3cYqvpwENC8AV3najAGQL8q6zTLpG66E/JxiExdh6zgaH/EHPPh802fXNtIjfyJxYb
 NjzXLI1Qzo+5q7IHHKpJNZs8gxrEuxZUv8r/XqG99stYGWkP/+ec6WGnHPUfsBuzfR9Z4DNKntS
 EECCRQWcyRUspUvImxzcXyyLKscYi5DzcZ7OXjVZHgqJRYtLb7FdQJphaFrfPS22QOScDmVygtt
 UibfTCNkznnWiVCAPHvSJP+L4hp1f64c4ipUIcX2BbR7s0qLWoz5CmSgXTHteKgkx42poKVnUwb
 X+CdtcwQc8DYUFO77y
X-Received: by 2002:a53:b4c9:0:b0:668:8bca:3c41 with SMTP id
 956f58d0204a3-66c514c07f6mr1531729d50.17.1786616429530; Thu, 13 Aug 2026
 03:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
In-Reply-To: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2026 19:50:18 +0930
X-Gm-Features: AUfX_mxMXl61z8KLSJ8kDOShwc_2crFn0jV7a2KzgZ4VeOsrDkfJFzM3rb-6Ihw
Message-ID: <CACPK8Xfgj+AUx0h_46f=qG_UEE_o7kTZ0=Buxr7+bdHDODHpgw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: Add K230 DW 8250-compatible UART
To: WX Chen <wxchen0913@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, 8 Aug 2026 at 12:02, WX Chen <wxchen0913@gmail.com> wrote:
>
> This series adds a QEMU model for the K230 SoC DesignWare 8250-compatible
> UART controller, wires it into the K230 SoC, and adds qtest coverage.
>
> The implementation supports the registers and features required by the
> Linux 8250_dw driver, providing an interactive shell over the serial port.

This is a model for the same hardware as this patch:

https://lore.kernel.org/qemu-riscv/20260616190147.1286316-2-visitorckw@gmail.com/

I'm not fussed which one we end up with in the tree, but it would be
good to name it generically so other machines can use it.

Cheers,

Joel

>
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---
> Changes in v3:
> - Removed all hardwired preprocessor #if conditionals from the logic
> - Added a helper for the receiver line status interrupt check
> - Encapsulated CPR and UCV register values in header macros
> - Replaced g_usleep() with qtest_clock_step() in the qtest
> - Link to v2: https://lore.kernel.org/qemu-devel/20260725-feat-k230-uart-v2-v2-0-d5fe82c47c28@gmail.com
>
> ---
> WX Chen (3):
>       hw/char: add K230 DW 8250-compatible UART
>       hw/riscv: k230: connect DW 8250 UART
>       tests/qtest: add K230 UART test
>
>  hw/char/Kconfig              |   3 +
>  hw/char/k230_uart.c          | 816 +++++++++++++++++++++++++++++++++++++++++++
>  hw/char/meson.build          |   1 +
>  hw/riscv/k230.c              |  33 +-
>  include/hw/char/k230_uart.h  | 198 +++++++++++
>  include/hw/riscv/k230.h      |   6 +-
>  tests/qtest/k230-uart-test.c | 514 +++++++++++++++++++++++++++
>  tests/qtest/meson.build      |   2 +-
>  8 files changed, 1559 insertions(+), 14 deletions(-)
> ---
> base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
> change-id: 20260808-feat-k230-uart-v3-0ff3651d70ef
>
> Best regards,
> --
> WX Chen <wxchen0913@gmail.com>
>
>

