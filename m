Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyZ2-0001wb-Q1
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQyZ1-0001vu-CY
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQyYt-0007lq-Iu
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:28:11 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQyYt-0007lJ-2K
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:28:03 -0400
Received: by mail-oi1-x232.google.com with SMTP id d7so13024290oif.9
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJOOxmMinqSKKEku91FQG3H/5a98axsYeH+hGvR5NGo=;
 b=hlNBCi3IlYyNBYQ/nI0+8yOP8nNGUVkb9RCoGzdQ9L4SKghcDE48hz4PsJpQNyDQvw
 fFbzP4WEzMGOPBoqSGWb7h0uRxPtLfNU0Beie7Q4nhTyv2ONmmKubtQJ8s+pTLdAU9ly
 3VOvCUzI4eDfGZ4kcqx1OzZ+TJM6wPNS1hzvrSeLGmGJlnjLqGzejBgcQaWK9ZKWDT7F
 M2ksu/4WmYW2haz5wYlhA0DV0eMBsyRtBjrxj29DcrWZzwktsTkqSfAwg3lDbprKgsdT
 2W0+nSwI9B27N7CGsuCjewVP5dtX5ErwR4PwXV2aws6Q6H0OvC0RGi8AZNyOLTMOagMO
 D8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJOOxmMinqSKKEku91FQG3H/5a98axsYeH+hGvR5NGo=;
 b=HYgRDPR/eW2FIF8Zj0cg2PH3Cc3IpHsO5PKVCEROwUBbAFWsniUqHIzztPsc5owhKs
 87tJcMaisn171x+DqPF+2+1T6GXy/KvwLkR6++OviUUQuKeN01ytUzOyje/84mPXqNm/
 e6SbT3bbLeUJ8pBa2Hga4OhW1V84pSTUzUUNg1FA9uA1AYl1XoL703Kdg7aOMU2iVoQj
 CA1nt5lTpR9GZVKTkkSJMlilXrlM8N1RciZqWGemg88ppIhiuv+D4rHBvQKRzvDyzPzI
 fmFpMWunEQ2425IHiusrn+aJWruKjo/fmAimdVI34MTH05VJC++PjEVY+WX7m0OHb5vr
 nBvQ==
X-Gm-Message-State: AGi0PuaRxn7LobqCjuq7mxfRmbXalrFRE8GxHLwWYqaGIR4gmGFcGIOY
 jbRNLq3JstIww+aa+S0liDSi/sHsy27NykZmwGBOGA==
X-Google-Smtp-Source: APiQypLfG330WBSuCDCtJMZ0fJBsu2WCRznwAWnWvfkEg5PrfpiCeWRxLOi9NVae/yYDSxWbue2FY/XEZBiyYppOwS8=
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr4153815oia.146.1587497281614; 
 Tue, 21 Apr 2020 12:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200421191001.92644-1-palmerdabbelt@google.com>
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 20:27:50 +0100
Message-ID: <CAFEAcA9ZrLDnU1KLmoPBqhS1fYVG05TzN3bojEGherL7PRhwFg@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for 5.0-rc4
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x232.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::232
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
X-List-Received-Date: Tue, 21 Apr 2020 19:28:11 -0000

On Tue, 21 Apr 2020 at 20:19, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> ----------------------------------------------------------------
> RISC-V Patches for 5.0-rc4
>
> This contains handful of patches that I'd like to target for 5.0.  I know it's
> a bit late, I thought I'd already sent these out but must have managed to miss
> doing so.  The patches include:
>
> * A handful of fixes to PTE lookups related to H-mode support.
> * The addition of a serial number fo the SiFive U implementetaion, which allows
>   bootloaders to generate a sane MAC address.
>
> These pass "make check" and boot Linux for me.
>
> ----------------------------------------------------------------
> Peter: Sorry I dropped the ball here.  I can understand if it's too late for
> 5.0, but if there's still going to be an rc4 then I'd love to have these
> included.
> ----------------------------------------------------------------

Nope, sorry. rc4 has technically not been tagged yet, but especially
the serial-property stuff is too big a code change at this point
(it includes one "let's just refactor and rearrange some code"
patch which is really not rc4 material.)
Also these patches have been on the list for over a month -- if
they were 5.0-worthy there's been plenty of time for them to be
put in.

Plus the last email from Alistair on the "target/riscv: Don't set
write permissions on dirty PTEs" patch thread is a note saying
it shouldn't be applied, unless I've got confused.

thanks
-- PMM

