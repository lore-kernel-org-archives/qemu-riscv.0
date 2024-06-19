Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE163C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 16:58:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJycx-0001ZC-TP; Wed, 19 Jun 2024 12:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJycw-0001Z0-Q7
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 12:57:42 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJycu-0006PM-Pj
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 12:57:42 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f99fe4dc5aso15371645ad.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718816259; x=1719421059; darn=nongnu.org;
 h=in-reply-to:cc:from:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eiDmzDOW1iFIBV3Az5hkNdWxxjfVtmZlraD0P/343WU=;
 b=lhjjQEPxRT1xBqmGmkTCqHsBieFbOfUpN8s5F33D2OMkpvwKwfe4ZsSVv4ra1N0FkS
 vrdz9a0CF27Y+K5TotKGUcmplUU3jTFmax8+/AIgnVkZ2tERMbqAe3us4ppfPJIEUqWJ
 Bkd89jtEBrON6IeWN/vvS9604+r9M13nxmBr8VW8Q02uE/sTvsW+nLN7PWn+nOSYXntm
 FtiBuqBchdSGkyTBFOJsKK+qgu7cGNrXiJZvwrvtMdpGoqoAaYDE1Uea57+q9b7UKNKs
 lE1/PXHUtcLh68P2zndwe1XSUfdjubxcQmAXka3NKEaQUA4a5pha6WI1p2iyzuRUpiFS
 xlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718816259; x=1719421059;
 h=in-reply-to:cc:from:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eiDmzDOW1iFIBV3Az5hkNdWxxjfVtmZlraD0P/343WU=;
 b=DiViDqUnAFOg3FfGRffX1y0DYd6bUKaW8tdELOFNyX70Z7xlCg8TMIaw7N+z+tibsX
 K2UWA79QXCeeXg9Qe/9IJmfx3KVIgr2A3XcO2USxb+7M8Sosxmjey6nq4W7AJvM6EwO3
 LztwF7S8sCSywmtyFxiUHJHlkwD5jD48y9WT2nDVpLFZnO4Nq4Zq0fyrbKF3lE+oV8MB
 KXSK3RfzJe6Dto9eSljxsIbQ3S1aF9nhYXkxwhh040J+8K2fN9wxWblUKl9zgVxUcuea
 AwT7fuxpANSoPsc7ZFykNdjMLmRk1MSnjfAvpmroDiPS/7EdE4P67wDCt78f63Im/l4D
 Lw4Q==
X-Gm-Message-State: AOJu0Yx3prAhWHqDo5SE1JRirxIvS9ZjWOwffUr6z7qW4IeMmo7oRfdK
 qmSzGAO/E3JzuJqQDYQ6nlbNTXCGWp3g/7cBXJHCrLTGGJ/8pO2DerLYIKWmYfo=
X-Google-Smtp-Source: AGHT+IFEX4UXO1lrqJeY+Ds36NckvViecM2femACYUG5smOB86ElBsb+wa8kyF//SLLXbusDXNVeGg==
X-Received: by 2002:a17:902:c083:b0:1f9:8f78:554c with SMTP id
 d9443c01a7336-1f9aa3faf72mr27813545ad.33.1718816258842; 
 Wed, 19 Jun 2024 09:57:38 -0700 (PDT)
Received: from [192.168.1.21] ([43.230.39.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e56007sm120173165ad.47.2024.06.19.09.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 09:57:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fP2y3ItovFPnDi3zkuNu0x0h"
Message-ID: <a78f70da-1304-803e-c4e9-34902dddf77b@gmail.com>
Date: Wed, 19 Jun 2024 22:27:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
 <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
 <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
 <CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com>
From: Shobhit <shobhit32t@gmail.com>
Cc: qemu-riscv@nongnu.org
In-Reply-To: <CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=shobhit32t@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.399, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.
--------------fP2y3ItovFPnDi3zkuNu0x0h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/06/24 21:45, Himanshu Chauhan wrote:

> On Wed, Jun 19, 2024 at 9:20 PM Shobhit <shobhit32t@gmail.com> wrote:
>
>     Thank you for responding, Himanshu.
>
>     Actually I wanted to check the value of registers, in order to
>     verify if I am able to correctly load the program to the qemu.
>
>     I used the command you recommended.
>     Using the "-S -s" command opens the qemu window with a black
>     screen, with the word "PAUSED" written in the title bar. After
>     that when I run riscv-gdb and do target remote, I get the
>     following lines
>
>     >> Remote debugging using :1234
>     >> 0x0000000000001000 in ?? ()
>
>     And if I try to do run, I get the following error
>
>     >> The "remote" target does not support "run".  Try "help target"
>     or "continue".
>
>     Typing "continue", leads to the terminal printing "Continuing.",
>     followed by no blinking cursor (what looks like an infinite loop
>     or pause).
>
>
> Fist add the following at the end of the program:
> 1: j 1b
> So it looks like:
> .option norvc
>
> .section .text.init
> .global _start
>
> _start:
>     addi x5, x0, 6
>     addi x5, x0, 4
>
> 1:  j 1b
>
> Second,
> At "Continuing",
> Press CTRL+c and you will fall to GDB prompt again. Like so,
>
>  (gdb) target remote :1234
> Remote debugging using :1234
> 0x0000000000001000 in ?? ()
> (gdb) continue
> Continuing.
> ^C
> Thread 4 received signal SIGINT, Interrupt.
> [Switching to Thread 1.4]
> _start () at test.S:10
> 10      1:      j 1b
>
> (gdb) info registers
> ra             0x0      0x0
> sp             0x0      0x0
> gp             0x0      0x0
> tp             0x0      0x0
> t0             0x4      4
> t1             0x0      0
> t2             0x0      0
> fp             0x0      0x0
> s1             0x0      0
> a0             0x3      3
> a1             0x87e00000       2279604224
> a2             0x1028   4136
> a3             0x0      0
> a4             0x0      0
> a5             0x0      0
> a6             0x0      0
> a7             0x0      0
> s2             0x0      0
> s3             0x0      0
> s4             0x0      0
> s5             0x0      0
> s6             0x0      0
> s7             0x0      0
> s8             0x0      0
> s9             0x0      0
> s10            0x0      0
> s11            0x0      0
> t3             0x0      0
> t4             0x0      0
> t5             0x0      0
> t6             0x0      0
> pc             0x80000008       0x80000008 <_start+8>
>
On pressing CTRL+C, I am getting the following line:

 >> Thread 1 received signal SIGINT, Interrupt.
 >> 0x0000000080007bac in ?? ()

Instead of the following:

Thread 4 received signal SIGINT, Interrupt.
[Switching to Thread 1.4]
_start () at test.S:10
10      1:      j 1b

And on doing subsequent info register calls, the x5 register is still 
set as 0x0.

>     Regards
>     Shobhit
>
>     On Wed, 19 Jun 2024 at 10:11, hchauhan@ventanamicro.com
>     <hchauhan@ventanamicro.com> wrote:
>
>         Hi Shobhit,
>
>         Add "-S -s” to qemu command line.
>
>         riscv64-unknown-linux-gnu-gdb new.elf
>
>         Then, on GDB command line
>
>         "target remote :1234"
>
>         Run: “info registers”
>
>         Regards
>         Himanshu
>
>         From: qemu-riscv-bounces+hchauhan=ventanamicro.com@nongnu.org
>         <qemu-riscv-bounces+hchauhan=ventanamicro.com@nongnu.org> on
>         behalf of Shobhit <shobhit32t@gmail.com>
>         Date: Tuesday, 18 June 2024 at 10:20 PM
>         To: qemu-riscv@nongnu.org <qemu-riscv@nongnu.org>
>         Subject: Is there a way to check values of registers before
>         and after running a program on qemu-system-risc64v?
>
>         I am trying to run a very basic RISC V assembly program on
>         qemu-system-riscv64, is there a way to check/monitor the value
>         of some particular registers before and after loading the
>         program? I have tried passing -monitor stdio flag to
>         qemu-system-risc64v, but it doesn't give me the values of
>         registers.
>
>         This is the program I am running on bare metal risc64v emulator
>
>         .option norvc
>
>         .section .text.init
>         .global _start
>
>         _start:
>             addi x5, x0, 6
>
>             addi x5, x0, 4
>
>
>         And I am using ld script to load the program at the location
>         0x80000000 in memory.
>
>         This is the command I am using to start the emulator:
>         qemu-system-riscv64 -machine virt -monitor stdio -cpu rv64
>         -smp 4 -m 128M -bios default new.elf
>
>         Here new.elf is the executable elf file created after
>         compiling the above assembly program.
>
--------------fP2y3ItovFPnDi3zkuNu0x0h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 19/06/24 21:45, Himanshu Chauhan wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jun 19, 2024 at
            9:20 PM Shobhit &lt;<a href="mailto:shobhit32t@gmail.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">shobhit32t@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">
                <div>Thank you for responding, Himanshu. </div>
                <div><br>
                </div>
                <div>Actually I wanted to check the value of registers,
                  in order to verify if I am able to correctly load the
                  program to the qemu.</div>
                <div><br>
                </div>
                <div>I used the command you recommended. </div>
                <div>Using the "-S -s" command opens the qemu window
                  with a black screen, with the word "PAUSED" written in
                  the title bar. After that when I run riscv-gdb and do
                  target remote, I get the following lines <br>
                </div>
                <div><br>
                </div>
                <div style="background-color:transparent">&gt;&gt;
                  Remote debugging using :1234<br>
                  &gt;&gt; 0x0000000000001000 in ?? ()</div>
                <div><br>
                </div>
                <div>And if I try to do run, I get the following error</div>
                <div><br>
                </div>
                <div>&gt;&gt; The "remote" target does not support
                  "run".  Try "help target" or "continue".<br>
                </div>
                <div><br>
                </div>
                <div>Typing "continue", leads to the terminal printing
                  "Continuing.", followed by no blinking cursor (what
                  looks like an infinite loop or pause).</div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Fist add the following at the end of the program:</div>
          <div>1: j 1b</div>
          <div> </div>
          <div>So it looks like:</div>
          <div>.option norvc<br>
            <br>
            .section .text.init<br>
            .global _start<br>
            <br>
            _start:<br>
                addi x5, x0, 6<br>
                addi x5, x0, 4<br>
            <br>
            1:  j 1b<br>
          </div>
          <div><br>
          </div>
          <div>Second,</div>
          <div>At "Continuing",</div>
          <div>Press CTRL+c and you will fall to GDB prompt again. Like
            so,</div>
          <div><br>
          </div>
          <div> (gdb) target remote :1234</div>
          Remote debugging using :1234<br>
          0x0000000000001000 in ?? ()<br>
          (gdb) continue<br>
          Continuing.<br>
          ^C<br>
          Thread 4 received signal SIGINT, Interrupt.<br>
          [Switching to Thread 1.4]<br>
          _start () at test.S:10<br>
          10      1:      j 1b</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">(gdb) info registers<br>
          ra             0x0      0x0<br>
          sp             0x0      0x0<br>
          gp             0x0      0x0<br>
          tp             0x0      0x0<br>
          t0             0x4      4<br>
          t1             0x0      0<br>
          t2             0x0      0<br>
          fp             0x0      0x0<br>
          s1             0x0      0<br>
          a0             0x3      3<br>
          a1             0x87e00000       2279604224<br>
          a2             0x1028   4136<br>
          a3             0x0      0<br>
          a4             0x0      0<br>
          a5             0x0      0<br>
          a6             0x0      0<br>
          a7             0x0      0<br>
          s2             0x0      0<br>
          s3             0x0      0<br>
          s4             0x0      0<br>
          s5             0x0      0<br>
          s6             0x0      0<br>
          s7             0x0      0<br>
          s8             0x0      0<br>
          s9             0x0      0<br>
          s10            0x0      0<br>
          s11            0x0      0<br>
          t3             0x0      0<br>
          t4             0x0      0<br>
          t5             0x0      0<br>
          t6             0x0      0<br>
          pc             0x80000008       0x80000008 &lt;_start+8&gt;</div>
        <div class="gmail_quote"><br>
        </div>
      </div>
    </blockquote>
    <p>On pressing CTRL+C, I am getting the following line:</p>
    <p>&gt;&gt; Thread 1 received signal SIGINT, Interrupt.<br>
      &gt;&gt; 0x0000000080007bac in ?? ()<br>
    </p>
    <p>Instead of the following: <br>
    </p>
    <p>Thread 4 received signal SIGINT, Interrupt.<br>
      [Switching to Thread 1.4]<br>
      _start () at test.S:10<br>
      10      1:      j 1b</p>
    <p>And on doing subsequent info register calls, the x5 register is
      still set as 0x0.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">
                <div>Regards</div>
                <div>Shobhit<br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Wed, 19 Jun 2024 at
                  10:11, <a href="mailto:hchauhan@ventanamicro.com"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">hchauhan@ventanamicro.com</a>
                  &lt;<a href="mailto:hchauhan@ventanamicro.com"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">hchauhan@ventanamicro.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div dir="ltr">
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Hi
                        Shobhit,</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Add
                        "-S -s” to qemu command line.</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">riscv64-unknown-linux-gnu-gdb
                        new.elf<br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Then,
                        on GDB command line</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">"target
                        remote :1234"</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Run:
                        “info registers”</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Regards</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Himanshu</div>
                      <div dir="ltr"
                        style="font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br>
                      </div>
                      <div
id="m_5859297554867400851m_2803145273736131556mail-editor-reference-message-container">
                        <div
                          style="font-family:Aptos;font-size:12pt;text-align:left;border-width:1pt
                          medium medium;border-style:solid none
                          none;border-color:rgb(181,196,223)
                          currentcolor currentcolor;padding:3pt 0in
                          0in;color:black"><span
                            style="font-weight:bold">From: </span>
                          qemu-riscv-bounces+hchauhan=<a
                            href="mailto:ventanamicro.com@nongnu.org"
                            target="_blank" moz-do-not-send="true"
                            class="moz-txt-link-freetext">ventanamicro.com@nongnu.org</a>
                          &lt;qemu-riscv-bounces+hchauhan=<a
                            href="mailto:ventanamicro.com@nongnu.org"
                            target="_blank" moz-do-not-send="true"
                            class="moz-txt-link-freetext">ventanamicro.com@nongnu.org</a>&gt;
                          on behalf of Shobhit &lt;<a
                            href="mailto:shobhit32t@gmail.com"
                            target="_blank" moz-do-not-send="true"
                            class="moz-txt-link-freetext">shobhit32t@gmail.com</a>&gt;<br>
                          <span style="font-weight:bold">Date: </span>
                          Tuesday, 18 June 2024 at 10:20 PM<br>
                          <span style="font-weight:bold">To: </span> <a
                            href="mailto:qemu-riscv@nongnu.org"
                            target="_blank" moz-do-not-send="true"
                            class="moz-txt-link-freetext">qemu-riscv@nongnu.org</a>
                          &lt;<a href="mailto:qemu-riscv@nongnu.org"
                            target="_blank" moz-do-not-send="true"
                            class="moz-txt-link-freetext">qemu-riscv@nongnu.org</a>&gt;<br>
                          <span style="font-weight:bold">Subject: </span>
                          Is there a way to check values of registers
                          before and after running a program on
                          qemu-system-risc64v?<br>
                          <br>
                        </div>
                        <div
id="m_5859297554867400851m_2803145273736131556mail-editor-reference-message-container"><span>
                            <div dir="ltr">
                              <p>I am trying to run a very basic RISC V
                                assembly program on qemu-system-riscv64,
                                is there a way to check/monitor the
                                value of some particular registers
                                before and after loading the program? I
                                have tried passing -monitor stdio flag
                                to qemu-system-risc64v, but it doesn't
                                give me the values of registers.</p>
                              <p>This is the program I am running on
                                bare metal risc64v emulator</p>
                              <p>.option norvc<br>
                                <br>
                                .section .text.init<br>
                                .global _start<br>
                                <br>
                                _start:<br>
                                    addi x5, x0, 6</p>
                              <p>    addi x5, x0, 4</p>
                              <div><br>
                              </div>
                              <p>And I am using ld script to load the
                                program at the location 0x80000000 in
                                memory.</p>
                              <p>This is the command I am using to start
                                the emulator: qemu-system-riscv64
                                -machine virt -monitor stdio -cpu rv64
                                -smp 4 -m 128M -bios default new.elf</p>
                              <p>Here new.elf is the executable elf file
                                created after compiling the above
                                assembly program.</p>
                            </div>
                          </span></div>
                      </div>
                    </div>
                  </div>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------fP2y3ItovFPnDi3zkuNu0x0h--

