Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcJg-0008Mb-0w
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 08:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcJf-0008MQ-5A
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:46:35 -0500
Received: from [2a00:1450:4864:20::52e] (port=34575
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcJd-0005fE-Nz
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:46:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id x15so72210080edv.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 05:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=lT7owlu9kJkl1DLiwDtaWf0BfcwxScHS1nkQk3oSy0mThst9XyTf9WnvWCVk0eQ8xi
 +7Wuug0OFye3gA7Gyv776v7uJV6hP3ZHE/ZBVKl5ZLtZm4D7H6lu8GeYJuK8xJmlIR1k
 3v6j0LFRLzCzvECJdozDQTMy7Byh2unTGJYz7AuziTpMOG0fyRLzQemoPCZAhgUAw2XX
 hOyoTO40pqzlPylb6kjNJvkg7rvBBxOy9nV8wyL7iSNPVO3t4OX6oEpSc+pHaJRCfdSb
 54ZtA3cXJ8MYWv78R1muAXVUoQuvmtBGKx3IaBVqEfxEYNsjIX3t4eyzdJsX2ZAjykoo
 fkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=lH/jNtVwKLFJm9w82jWNrW9Xjp3+96S7u+VJRNGZBhV9Kw3KkI+DT71ITVlSIzppwC
 aEby8bhGe+a+wKloY2CwA5FJ+HFXzk4yPpv/87mkBUZb1r3b112A5ElRCl+77INHy/Rb
 G1n4+GgxsIp+iREye3AYAiT8qqNUPwr2mYpef3PSuj0xwerefZtZ/wpya3SNG8gQP6F6
 SbYPxb3VXZa/AaYbN7x6JbI3BRelEFCztprxqP0temPBpwNYXTK7kWm7zhvX05NKsM2v
 zpGxX+r214AHVkCG9WzL7ccf4hnlmswcMoZ0yNDSfAGl/jIIn2LACWntJSsxMiC/X1dJ
 Djyw==
X-Gm-Message-State: AOAM5324so5T1xppZse1Z9DQS1uNJ1LhBk7e6kjSj6gSfxzUAT4qXHsz
 kK1diDMAzbXDLSgTcwA1aqvIqYFKLkfaYplRbV24dYPVR5E=
X-Google-Smtp-Source: ABdhPJyv83Li++NvDv4PDTOCnV+/Fvv1WQCJ3i+dOUkU8EDnX72tela3jDWscYXtZXKe2iHpb6yXT0aBzmqkRWA1LC4=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr47959699wrf.302.1636983647148; 
 Mon, 15 Nov 2021 05:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-2-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-2-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:40:36 +0000
Message-ID: <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org, 
 andrew@aj.id.au, joel@jms.id.au, b.galvani@gmail.com, jcd@tribudubois.net, 
 andrew.smirnov@gmail.com, sundeep.lkml@gmail.com, hskinnemoen@google.com, 
 kfting@nuvoton.com, nieklinnenbank@gmail.com, Andrew.Baumann@microsoft.com,
 f4bug@amsat.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 bin.meng@windriver.com, palmer@dabbelt.com, atar4qemu@gmail.com, 
 mark.cave-ayland@ilande.co.uk, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 13:46:35 -0000

On Mon, 15 Nov 2021 at 12:56, Markus Armbruster <armbru@redhat.com> wrote:
>
> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
> and marked FIXME.
>
> Move it to the boards that create these devices.  Prior art: commit
> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
> device "pl181".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> @@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      /* Connect an SPI flash to SPI0 */
>      flash_dev = qdev_new("is25wp256");
> -    dinfo = drive_get_next(IF_MTD);
> +    dinfo = drive_get(IF_MTD, 0, 0);
>      if (dinfo) {
>          qdev_prop_set_drive_err(flash_dev, "drive",
>                                  blk_by_legacy_dinfo(dinfo),


This part looks like it should have been in the other patch.

-- PMM

