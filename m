Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpStc-0000JX-S4
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 04:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kpStY-0000HV-NU
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 04:14:52 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kpStU-00005c-O5
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 04:14:52 -0500
Received: by mail-lf1-x12b.google.com with SMTP id l11so46557862lfg.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8Bo/NRBH2yj1+iDGWMOna9YGAL9PrYYyzakmAnRfOs=;
 b=S8cA/Zx9PqqBsJTOTdix4v38OaD6Tmztg+OCO9z3whsUjOqWc5c9g0lZDadBeh9kde
 x7FvxHgrMrt6jk1NkFU8q7H1SMJUYAcaHSC+AajmsGb1DMik29J9IOV2jQ/Y6hCvxdzn
 Y4mcffoMoD0aJxJA9M4HZHt3TAe09ftPHgQ05aRuaJv+xJ8QYJhbd9xp4WEtu4zJVdkr
 od+1idTcKQFGM80btm5Txxc6PqSoDZbxHP/bpNeoY+QDTDPdtAtFAke/ta+InIzHBqm/
 qsZxQNaYNx6AJNpTL7FLiYIsPnu/hZNKWGKJw+EoVww6dno+Z292REdS/r4nEvODR7c8
 6UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8Bo/NRBH2yj1+iDGWMOna9YGAL9PrYYyzakmAnRfOs=;
 b=BCX9KVkDFu7Wi9vSeWB4U/Agxslcr2Ad01zOikwo02hHx9Fmyz2cH0QjDCpidR29BU
 DmSCzHXsiQicEjKc9BV6xhhENpJr4fW1CMuMHdOdfZGeFGok4H0gZK+YTj6YMEENXC0R
 DXrgZKhoVTRuZVh/R9OF0YdL8PxM8wBPurH67qV61PM7T7ZQkqA9bk82ETrWMYfvLUrl
 RtfGCQyBif7YB9x0/kLeGPzxXZJ9ZrP/y5T5mt14ht+uMrehr5+x1GBbZ1yL6D1zKqj3
 DwBk4RxGBoiBE/Na9Shp4sUdT1ubLrDZ8ZawDWPIOGfRLuUBJ9v7rSG8i8flRRJzah7n
 dtfQ==
X-Gm-Message-State: AOAM531RWq8Ln0JEGA57+Bjq9mw0iA6tSikrxcE+64Z2WBwRVf15O+mZ
 ZGvM8sQATZeGc9TpFaWVd6AHpOJ5So2uWoaxKjgJSQ==
X-Google-Smtp-Source: ABdhPJz4M43ShrYqlECNs0TItl6tD3mEVhY+6nvHNdRc4QaG2YsfbJf804Ms1m6nTeZ4MkyRa/BN8sPtO6R7/z3TXBc=
X-Received: by 2002:a19:4a13:: with SMTP id x19mr12105339lfa.648.1608110086351; 
 Wed, 16 Dec 2020 01:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-16-frank.chang@sifive.com>
In-Reply-To: <20201216020150.3157-16-frank.chang@sifive.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Wed, 16 Dec 2020 17:14:35 +0800
Message-ID: <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
Subject: Re: [RFC v2 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=kito.cheng@sifive.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 09:14:53 -0000

Hi Alistair, Frank:

Should we add the bext_spec option like Vector-ext? I would suggest
adding one to align the behavior between V and B.
But I have no strong opinion for this.

>    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),

