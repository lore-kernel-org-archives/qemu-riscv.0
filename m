Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn7oK-000333-NM
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 17:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7oH-00032l-Qg; Wed, 09 Dec 2020 17:19:46 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7oE-0007yS-Oy; Wed, 09 Dec 2020 17:19:45 -0500
Received: by mail-io1-xd44.google.com with SMTP id z136so3375356iof.3;
 Wed, 09 Dec 2020 14:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vfY1/zFQM28B3wC4xTWhKqmMIvMJ1vOwkRbrzZeXjk=;
 b=vOOigCjkP+zg1VwfgPfQ4PRcoFputKi48WlafZby6rwr9WQHqwL1izkorEuTEYKsTO
 yk2Vzgf0FgHutqg5X7q6e/OT8TSNXU69mS3b2oCaWnX8CWp85Uj+UoKSPsBYDLmSWuXu
 1alRPV0qnZQyQGv0u7qRx1pU8ES79NTUl9WkliMQuiY9/hBGESlw1kck85aaVy1HZOAg
 ow1JIs5wHjqkuAMMMg3FnDplqFeyTb6KuwcyUyJkWFUNSg5LdUr/QDT4tRsX9fGTsqaw
 a3srjHST4/2+CoUfk3g5Le5UnXZQH0keR4LONP82cBq9uNF1uqNQnqE7drxNLLAHiWSJ
 UsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vfY1/zFQM28B3wC4xTWhKqmMIvMJ1vOwkRbrzZeXjk=;
 b=FwIBPNsQDsUaMKKzdUbsj59DWozjwmSE2mU+vUCKCyt+mxp/HzOa5MRn7bZUpP8Fwn
 vYMsv7ZxV/C3fOMOs2PQzb3tDV1Xkp8kypKD3g54en6aoGyccIThZQ+aEdXMu6mF0npZ
 KDXLhhwg4XpyrZZs4ZjnncKInv5w/nh9ybq9i2sogcay6XisgcsExjpnXuhIbqz/LvT/
 IBNWh6ws2M4SdcawP4+E6WlC4Z7zb8QxQ4tf3hgC+Zsb0HscX8C8WTt6XMXfnRWQ7Wie
 TGx/f1Qlk7HqpaawSAO3Vnj7k1sNA7019HFeTk7FYGtI8w3pYm9+7MMDkU5Q/G2QX2kl
 BGNg==
X-Gm-Message-State: AOAM5325UETOlNUDrWd0vxYhX3f34I+cgE0R+wwEbMJLgIo/KLNn2rjr
 XfEvJhXOaW2rSn8O+hoCzf7KL5TTEHNY3x+Ymfg=
X-Google-Smtp-Source: ABdhPJwIJu+mcU+s1TiHhwdlT6kzu/IROXoLEpGRkOmu9yIYn9gM1F/XtS5rmjUUvPpz2eEVkdrENscNyopGBQyuIHE=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr5891393jab.135.1607552380949; 
 Wed, 09 Dec 2020 14:19:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <64d6afcb62eb7b27b863436219cf1a4e28018de1.1607467819.git.alistair.francis@wdc.com>
 <b19249c1-2aef-ae9c-8109-d6d5d0a4425c@linaro.org>
In-Reply-To: <b19249c1-2aef-ae9c-8109-d6d5d0a4425c@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 14:19:14 -0800
Message-ID: <CAKmqyKMpM2Q9++_2NCDNVA_uKMWbK+pWZo2stY9Pf95X-tAh6Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] hw/riscv: boot: Remove compile time XLEN checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2020 22:19:46 -0000

On Wed, Dec 9, 2020 at 7:51 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 4:56 PM, Alistair Francis wrote:
> > +    if (riscv_is_32_bit(machine)) {
> > +        dinfo.magic = cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
> > +        dinfo.version = cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
> > +        dinfo.next_mode = cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S);
> > +        dinfo.next_addr = cpu_to_le32(kernel_entry);
> > +    } else {
> > +        dinfo.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
> > +        dinfo.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
> > +        dinfo.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
> > +        dinfo.next_addr = cpu_to_le64(kernel_entry);
> > +    }
>
> This looks like it's still based on the TARGET, but via the types in
> fw_dynamic_info.  So far it would be clearer with sizeof(dinfo.magic) or something.

Fixed.

Alistair

>
>
> r~

