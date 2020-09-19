Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJjYA-00036r-7w
	for mharc-qemu-riscv@gnu.org; Sat, 19 Sep 2020 16:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kJjY9-00036l-9b
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 16:33:37 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kJjY6-0005Fw-R1
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 16:33:37 -0400
Received: by mail-pl1-x644.google.com with SMTP id k13so4822214plk.3
 for <qemu-riscv@nongnu.org>; Sat, 19 Sep 2020 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KW9dizA5K9D0ay5CbQov3kkorUzg9sE5lKwlRj1tkjI=;
 b=xQzAqUCfhZ7Pgep7LJZrFgxApN+lWbUbkXM0H0KsBQb9GhTCid4EUBhFKBkF2lNgwg
 sLNqtPpOWfJVmZ7m+CBATdXFUJo9Vp8/5mtaE2QwXfqadO8ZJvMZJOwboj1WkBoCv7dD
 yUiqgUsFbgd4xIM2FYhn3EnoZacZ2vIpV+LvN2TnF+qXScu4IfHArj9s7fLAdSBy/Iq/
 ud6drnTJGQZAO+vvwQ3JDBRoX/LhyDQsI6wvE39ud6TGoH19f56w8Vtl5RkJAPfQK42U
 rfFyX8eC46L57Ig8AoL0H/dPPVehetYV/WFwv/q3jpwt1+twohLREq9Cj8bZSMARI/hu
 3iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KW9dizA5K9D0ay5CbQov3kkorUzg9sE5lKwlRj1tkjI=;
 b=oKqMkygPp4aj0fh2qXCH+ccTaMCxtyue2/VEEM2IjCg7tan8vmQlXYfjZynLWMotol
 lZBk1BK5V3PaVVzvEk6dtCeRRsuus3EzLsUyuaN71Kwpl0skBRgpMiJsHGm5ceW1lS++
 NEfTWNH3GIi8vkNmC7QL9q/c9Esbxow+AzW/3Ro1cMpyGmZFE+17+p70HYuEWghv+ZsK
 wbdXCdXVJjwdwCzSUSVOHEnh+TzoCFRMspLL1mX9NJEdMcHf8DgSm33LHu7axRjTR4D4
 bzgDHUdBpL7GA3CwO+4KvMCUeIIz9VjJeaXtahICtqMw1FUEn0aTS61hxU/D/6q28h8l
 hUIg==
X-Gm-Message-State: AOAM531XbFSPguLkChLP7nBcjlnM43B+m7TtUpxTfEkTlKzb/+TapDPm
 tUfc8pH2cUETDREKE29xdQ5Az+6RTwU7VvV1
X-Google-Smtp-Source: ABdhPJxWCr/6NPOur8oYkAKErsERDVniAmbrKnKH/jfgUW2yk5dmHyQOfeK1LvV6yExoQd3kIqPa+g==
X-Received: by 2002:a17:90a:9912:: with SMTP id
 b18mr19508176pjp.192.1600547611732; 
 Sat, 19 Sep 2020 13:33:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gw1sm6603688pjb.36.2020.09.19.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 13:33:31 -0700 (PDT)
Date: Sat, 19 Sep 2020 13:33:31 -0700 (PDT)
X-Google-Original-Date: Sat, 19 Sep 2020 13:33:29 PDT (-0700)
Subject: Re: Fwd: riscv32 wait() problem, qemu or glibc?
In-Reply-To: <2107152.vFx2qVVIhK@noumea>
CC: qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dilfridge@gentoo.org
Message-ID: <mhng-a7087781-d72b-4824-b649-2535cf70327e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 19 Sep 2020 20:33:37 -0000

On Mon, 14 Sep 2020 09:23:10 PDT (-0700), dilfridge@gentoo.org wrote:
> [forwarding this also to qemu-riscv, not sure what's the right list]
> An: qemu-devel@nongnu.org, libc-alpha@sourceware.org
>
> Hi, 
>
> first of all, sorry for crossposting, but I'm dealing with many moving and 
> experimental parts here... 
>
> Situation: riscv32 (ilp32) qemu-user [1] chroot, Linux [2], glibc [3], gcc [4]
>
> The following small program outputs "child exited with status 40", which is 
> rather unexpected (it should be 42). Any idea what is going on?
>
> (This is a simplified version of code in a configure test. The test has other 
> potential issues [5], but in any case it cant produce useful results on 
> riscv32 right now.)
>
> TIA, 
> Andreas
>
> ====================================
> #include <stdlib.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <sys/wait.h>
>
> main(c, v)
>      int c;
>      char **v;
> {
>   pid_t pid, p;
>   int s, i, n;
>
>   s = 0;
>   pid = fork();
>   if (pid == 0)
>     exit (42);
>
>   /* wait for the process */
>   p = wait(&s);
>   if (p != pid)
>     exit (255);
>
>   if (WIFEXITED(s))
>   {
>      int r=WEXITSTATUS(s);
>      printf("child exited with status %i\n",r);
>   }
> }
> ====================================
>
>
> [1] qemu built from git master, Sep 12, 2020 16:30:37 EEST
> [2] host kernel is 5.8.8
> [3] glibc-2.32 with the rv32 patch series backported from master
> [4] (Gentoo 10.2.0-r1 p2)
> [5] https://lists.gnu.org/archive/html/bug-bash/2020-09/msg00033.html
>
> -- 
> Andreas K. Hüttel
> dilfridge@gentoo.org
> Gentoo Linux developer 
> (council, qa, toolchain, base-system, perl, libreoffice)

I don't see any replies to this, but for some reason I remember having seen
some.  Did this get resolved in some other thread?  I'd bet that it's a bug in
rv32 user-mode emulation, as that's been only lightly used so far.

