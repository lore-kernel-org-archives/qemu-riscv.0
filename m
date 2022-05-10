Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noOvq-0004vg-U6
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 08:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noOvp-0004sT-4Z
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 08:25:37 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noOvm-00073T-AL
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 08:25:36 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v59so30328833ybi.12
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5OfL9fo80UfutDJ+0HQ+RALohbyp2jbzVcIE45PfgKU=;
 b=n1SZU0U2Hj4naumZm9HIo0Ea0jW7VFWsvZXL2vNgCe6CMmwkg08D/VMsG7dj22bYi+
 fFQhztBuONEF6AByZaor9i+raogpcCWAk9nh3ICCdi8GyVmrF8IBcLp7jzpLeYQ6qD05
 4PicRWRf9ukf9pKzvUgAZ7GIFzjfeg4/PL7Pfg8uRLtXeBjBpw4NKi3pKMBQ7eztKIEA
 C1Lghy9L36rKdPyV+QI5d0eXY0U4ZT8oWlmv1ogzerghNBTgxFyDrYGAQ+2qQVh9DINN
 Nb5uqiWd/pzAgKCZgQZ8lAdvIdXkokflObzfV/kwbG4sWAbEMaZp3TsgkTiIY6oav+Fe
 Gecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OfL9fo80UfutDJ+0HQ+RALohbyp2jbzVcIE45PfgKU=;
 b=J6rmZ6wSXoy/eQsRky691GvoKPiVJI3/wLMeJY0OoXTAs6G172T4+lKuuLbx/H4Tqf
 MQe59ZIzvc7HfCoj7XblVGYAsIX8Q8FSU+YVf7jodan8ThdHyqhI9DK/SWlvu3HnPP15
 fUuUygfgALKO04dQf9CBtCT3/WUBYxLnpQMVNd1RHzQ8/XnKAlV9Xv77l+Byp/sldjN3
 6hxc0RFGCLGYjv0pD5XAMnaR6GhaVdFfLWqGH0cUQT6v2m7GTLPWi6OghZauHqSfl9u6
 zlpw0u7bGugo4ohGJUEKN79csYB8t8I7JbGGYO+SJzqYS3btAdls+oTJysvjAp5zHvY/
 AcwQ==
X-Gm-Message-State: AOAM530wFgKpkZfZnluldnwfbAhVB8Sh/qM8pYudTWmRS2wfTkjJVJrP
 M1bzyiMqKcUWbT3SPcqwGfRlbVM7KO13PyZhjEb0mQ==
X-Google-Smtp-Source: ABdhPJwvkaR0lJS7caZbBXMSaKnnZNkjsPQS4U2k9RLp8lq9nHkPV5pSo3Kn7myVP1oDQ8Um7GccSoyG2AMiNtTXfFs=
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr16100180ybc.85.1652185533241; Tue, 10
 May 2022 05:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm> <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
 <20220510122056.l6deselsfipofnct@sirius.home.kraxel.org>
In-Reply-To: <20220510122056.l6deselsfipofnct@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 13:25:21 +0100
Message-ID: <CAFEAcA9FLSZzmMuvuUikq+2tPTQJhbqHzL125One2_DVpCjUvA@mail.gmail.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, 
 muriloo@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-RISC-V <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 12:25:37 -0000

On Tue, 10 May 2022 at 13:21, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > I'm not very familiar with KVM on ARM - but is it possible to use KVM there
> > with an arbitrary machine? If that's the case, a user might want to use KVM
> > on their 64-bit host to run a 32-bit guest machine, and then you need to
> > keep the 32-bit machines in the -aarch64 binary.
>
> 32-bit guest is 'qemu-system-aarch64 -machine virt -cpu host,aarch64=off'
> (and a aarch64 CPU which actually supports the armv7 instructions).

It's still armv8 even when it's 32-bit :-) The requirement is AArch32
support at EL1. (Some hardware has AArch32 support at EL0 only,
ie userspace but not kernel, which obviously isn't enough for 32-bit
KVM guests.)

-- PMM

