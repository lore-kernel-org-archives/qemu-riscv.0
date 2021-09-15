Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQOub-0002aD-26
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQOuY-0002Xr-PF; Wed, 15 Sep 2021 03:00:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQOuX-0000p0-7g; Wed, 15 Sep 2021 03:00:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y132so1319256wmc.1;
 Wed, 15 Sep 2021 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nb19ci96u3IUUidBv4wolxo/PqC0IzC4bkQ6SDizgY8=;
 b=qLKVfD6FuakluSM/fGLN+CUMiQj4cJnpTz1tLk8aI9UhJx4/c/xFq0IR6uEBlTGUcA
 R7MY/JgPPAqd/6tiujru4sStx75pUfo1K9e1X5MMfH3ZrAvX5gnqNltuY9nmp9b4Xf5W
 AHWtxWHYgq6AvKosz38cO6RKb0FrJlq70fAY7VyWgkDoA/Pait0a3aJd8hH6xWwamJlN
 g5ZqzIBmC8OjqlMKX/iX6PHkAcwAvuJ0v7DM5wIAGH6KYUTc6VzppYacRHKT5kO5jwyy
 bHWBmWcpDuVvXWBvleIDESi8NLMuSHqE81/fVQkTdwDdocMt97cYAVXjFROgJtgzSG3s
 +oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nb19ci96u3IUUidBv4wolxo/PqC0IzC4bkQ6SDizgY8=;
 b=IL74gpwPVJUQ4po+jqgKGkybLFZ/l6NqrN+yTB9leM1N8/VecaTUhU+ZiFSAcgfad+
 bcKODQAwCPJ+Cqq3oEga2oncq+LEJqVbcQimQLJAaBrLbLb8nr6ZJZLWBxC9rzMT4mXw
 DzR7urqa4RXD/hl2gBIFLURezH7sFLoHdX7LGos5cd+VpgT5ZH2ftpj3tuIrkKnfhuh1
 QY3Qhn7DwvX4YaBPR4JEARtkG7qGgbz95YgNwB/lal6NHJJWjo44henvJdxzj3h+LgFX
 CmZ827CaeFjtVKru78WtJyHCL8eFG9lcAUb2Qf1kO4nKelqN9/R6Z+vwvLPR/DnbcyEB
 gVYA==
X-Gm-Message-State: AOAM533+il0qnq/oOwLuv/udhjzhsaOQAxHZukaDtHOZj1jCmFNbed7q
 3pSJvCTf2UzU8qxO61uHPdo=
X-Google-Smtp-Source: ABdhPJwJiBY+C9p8TtVIE4zoc1Ta74elamDrcWp2XwJ0tXsJM3cQCPrRasqwO52kXQeepRfcGEGqiQ==
X-Received: by 2002:a1c:149:: with SMTP id 70mr2746679wmb.187.1631689246206;
 Wed, 15 Sep 2021 00:00:46 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q201sm3629594wme.2.2021.09.15.00.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:00:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 11/53] target/hexagon: delete unused hexagon_debug()
 method
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-12-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8bf9d50-6e03-308a-024e-2d2093ed418a@amsat.org>
Date: Wed, 15 Sep 2021 09:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-12-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
X-List-Received-Date: Wed, 15 Sep 2021 07:00:51 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This method isn't used in any code and its functionality is already
> available via the 'info registers' HMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/hexagon/cpu.c      | 5 -----
>  target/hexagon/internal.h | 1 -
>  2 files changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

