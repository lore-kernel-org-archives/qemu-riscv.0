Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMn5s-00073a-Qu; Fri, 21 Jul 2023 06:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qMn5q-00073B-QY; Fri, 21 Jul 2023 06:10:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qMn5p-0003dN-CK; Fri, 21 Jul 2023 06:10:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-992b27e1c55so275649766b.2; 
 Fri, 21 Jul 2023 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689934234; x=1690539034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qymn8+xMfnEFf9vto2JvkJD8qZM7Yqf3q+SKYQ6sqS8=;
 b=XqYcgNpPZ6BGgrfn8rHN7L/XVrESnK9gh13+RynNFKSWJ4qKtLp+ioQx2adWJlRStX
 ylhdiEoSj+DPYcLLl4LEODdnAg34pneoQZcOL/UAyKTr+v1h+BJ1QdjWLxOpph/5suWo
 Vu40xJdILxpCqwnUmumXUP7vZMBYdR3FhhjtsAY0g9TeIzlIVBqWbm/olunaYvZNo5nB
 NyOAZtmpg2LEd0Xm6372LA35w8xfqlI7o3Vifcpf7yS96igerUfhAJVbIsd+Gf03/3ov
 W4gG5tpVsuMNpvNTWSGJiWa4o1Y+H6TEhQJli/Qtr/vAuv7pu3tJyBxDneRHjN5DmlWB
 c5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934234; x=1690539034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qymn8+xMfnEFf9vto2JvkJD8qZM7Yqf3q+SKYQ6sqS8=;
 b=K5FuR784d2oB0WymIlXZkdYrum+ZtL8NYleeFRj/8kXHserIGIXtc/XBMNm9YSPP1+
 axA4JjNoIZKLirZe07W3LruaBTOlysBnCiIo0G+GxRJ3Py0aLbQsBXOb3iDo3n4KCyrl
 gxCOivJ5rGzgq0lL2NDS/rjG/EXL0Ebq0wGE06pMk1wpZf04Svqy1F4kirUpyrLiHqg8
 aUruKQeZuJwu6LNpJ7wswSLqE+9Z8R2gCLWqGnUmX8k7/9D0UGkR6EL1+PFAlDRTKWLM
 3MFAqDFkPmdAqpF9KEGYtZ4435MWEHOPl1Gh2vhIrgemAUXsIgDXQQT3mFzG3huBb3PM
 ZCjg==
X-Gm-Message-State: ABy/qLYTYrPifEDo2aJacCljeZuNX+vuwJD2PyoK1TnGugtJVruvRK+i
 7liIhB+0NbEAo2An8rQ2PH6KxuF8sKo/4/7nAw4=
X-Google-Smtp-Source: APBJJlFMFZMH5/wIJ2JwXR+9DRNVYAqaWTTFSzyGW9go0l3M/D0xPWSJNlGbmLseibVx5UyeR45t7HqBFmV09fOcNYI=
X-Received: by 2002:a17:906:51c4:b0:994:569b:61b8 with SMTP id
 v4-20020a17090651c400b00994569b61b8mr1203690ejk.58.1689934233892; Fri, 21 Jul
 2023 03:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-3-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-3-thuth@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Jul 2023 18:10:18 +0800
Message-ID: <CAEUhbmXYyh1GwbU2jZeqJW0UNRj-GpEoyqtnU8HttQTu3LQDpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/char/riscv_htif: Fix the console syscall on big
 endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jul 21, 2023 at 5:48=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> Values that have been read via cpu_physical_memory_read() from the
> guest's memory have to be swapped in case the host endianess differs

typo: endianness

> from the guest.
>
> Fixes: a6e13e31d5 ("riscv_htif: Support console output via proxy syscall"=
)
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/char/riscv_htif.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

