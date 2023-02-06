Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOyof-0001cq-HO
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyod-0001Zs-Lp; Mon, 06 Feb 2023 05:33:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOyoc-0003NG-2V; Mon, 06 Feb 2023 05:33:39 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dr8so32735500ejc.12;
 Mon, 06 Feb 2023 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aqj4MQvgzEol6YVxU+DfwsWn9KVJ+nsaoqo1r9hjr2c=;
 b=hZhJt+7xOqxQHtJGi1/dWM+RcdToKM6U6SWwY7iqPYgj87+imPN6X/4/ro8cCT3t/6
 XG3AD6+sbHE6m+waSqEP4a4fE/ropQPXiHpXEALU0rEb1pZ+cWF2mVdzx75+v4CLqTqM
 kzSwBn5edyPDDjoDhfk/Pn7BayLhP5tNJXlaGoVfOBrgyfieaGpJY8csxVg2xt9qmBZx
 zAyFWKj71bgQP4trr8dqC2gYMqLwCQcpoXprqnTgCQkooi4KxT4sLwF9EhqDYryixGVw
 zmx5tisIvGCQF6xu0GLuEbbqGBvM6OZjKv83vyp6Ja5X/RjoAST5ortYHDEFaxn70ZdH
 BrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aqj4MQvgzEol6YVxU+DfwsWn9KVJ+nsaoqo1r9hjr2c=;
 b=Zzmfvw68lXvik4aPenLAONSO9MBV7AkE2kF0RWTMghadw+YjnCdc1DwCaFREDrLFFA
 OnY71jW8cz7CSKGPhSOIzbqVux+V8UeE8rTkpjUVR6LEAkZNAUVgUOfBgov5NjWJPzVj
 +bomV07+lfayCMBXeiNgLxRbqgQm5WWt/gd0Z5uP4RQOFziJ01PvIjAUH5Gll0pTShMx
 m9jSXjEYfp5Q0fRE+o6h1JBLRmVjjGepUxXT08ABIyE2HfckRgSN6e7hDte9ox8u3fjh
 LzmNVHy9wNYvQzDdh6G0Wziq33696gSc4SIEad2QNtWXsAfeopcJhcu5TTZZy9NQ2Yg9
 CJ1A==
X-Gm-Message-State: AO0yUKUV83UZEeL/wTu3jJ8btxvfgIvgzMiOWUVx1p3sCb4py87q1UqD
 g3iy7/58Le6fgsBhORWO7HlnXRKXh9M+YzAIfUk=
X-Google-Smtp-Source: AK7set/6StgfWWUOkvzRDUXJLPaEiftT6VE9Fc4WgZUGlx/MDt38kxz0J4o7iPwO2rJ77hm6byA7Kwitcv3FOvluL2k=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr6194026ejx.163.1675679616629; Mon, 06
 Feb 2023 02:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-11-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-11-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:33:25 +0800
Message-ID: <CAEUhbmWpDROoYoEsmZZeM_zZNbb04OECA=LmNPg7VWZNjJ5BKA@mail.gmail.com>
Subject: Re: [PATCH 10/10] MAINTAINERS: Add entry for RISC-V ACPI
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Feb 2023 10:33:40 -0000

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> RISC-V ACPI related functionality for virt machine is added in
> virt-acpi-build.c. Add the maintainer entry.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

