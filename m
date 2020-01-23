Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuhSD-0008By-35
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jan 2020 13:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iuhS9-00089Z-Ia
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 13:43:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iuhS7-0008Lo-Sm
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 13:43:41 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iuhS7-0008LS-KJ
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 13:43:39 -0500
Received: by mail-pg1-x543.google.com with SMTP id z124so1789569pgb.13
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2020 10:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=GP/r9PIlSLqYQhKV2QQNMvljVe8xKLDedn52KnK8YEc=;
 b=u7ak+r4HNGSYzN10dl2xekH55MhnLCc8D0BDny6v+p+7ty6IqpkPDBs2Bz1lLqsLVD
 0VPIArxeBGBEBi3xwCU4KdQ6yQHvavdsm3aH4cmDuvcc049LTROtvBnGDOM6P953XBcD
 6FObmd69Vl+r0nldTIMco7AELRP9xEsJpatw3I1IbIKPEMGApcdwBMjtdwvvL1dmJTnS
 4QzaC9OEM2KyY7KuX9pWUcHuIYt9PD/EshBtNNpSwXFHwHJwLa4syEXUyZB7NaC8K5Pt
 D4avERIouW9fvrimoS9WCLJwookIMGZNOJaMvEU7RbQpasAMSpB+Yk5zCL0CZSEVA0vZ
 310w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=GP/r9PIlSLqYQhKV2QQNMvljVe8xKLDedn52KnK8YEc=;
 b=KRswnTdSYZKiSPRgJmZ+zY2IdV3ZWxDYThc/8K6XEsPULWZ2hOoH3nm4dmeQ8utVP6
 eiy8W/jyvBo3/un1351z3uYok0gHzgdXEmWgQELDIoISGWYkLBVXjRInsHiqyFDGb7nI
 q7HekLBsRfTSmeUEbehSnOQeOdlCCwVJD+w05+0zf2mgCrJlWq6bQIlTtE8S+CFswAs1
 qzaOli6koRX7lOwMcklX/Cp7vnWqJrk44Hbxg4kwsX0aZ6QfP4zmheeNKsc/eELknkcD
 DkhoK9OcSWuQ+y9eX1MEZ50XN52+ZtBPGiL+4w6O8fOTcgTyGP3Jfiyi76kpsN5hqi4t
 lMeg==
X-Gm-Message-State: APjAAAVDIVf8qAMnLizDE9QX6wL7pT7QOsyNr23VB+Nu6B8BN3tnApYC
 xTJWQ/2LuzKCpvvnjb4pclTaNtaORi0=
X-Google-Smtp-Source: APXvYqw8LKSOPhzj3wIR6MKwNKQ4u3nx3Bh0YeQptuOkDEI+tl1AjDXSb+kVGM5R4uC9JO+kGtX9mA==
X-Received: by 2002:a63:66c6:: with SMTP id a189mr115356pgc.401.1579805017815; 
 Thu, 23 Jan 2020 10:43:37 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:bf69:4011:cfff:c9e3])
 by smtp.gmail.com with ESMTPSA id d27sm3491014pgm.53.2020.01.23.10.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 10:43:37 -0800 (PST)
Date: Thu, 23 Jan 2020 10:43:37 -0800 (PST)
X-Google-Original-Date: Thu, 23 Jan 2020 10:43:35 PST (-0800)
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 1
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9YoAjASu4F1hZRjbq5S+h8GtBUVb9dgecMdaWb9YENEw@mail.gmail.com>
References: <CAFEAcA9YoAjASu4F1hZRjbq5S+h8GtBUVb9dgecMdaWb9YENEw@mail.gmail.com>
 <20200121225703.148465-1-palmerdabbelt@google.com>
Message-ID: <mhng-ea4d4047-6dfa-4be0-8ce7-424b1d17560a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Thu, 23 Jan 2020 18:43:43 -0000

On Thu, 23 Jan 2020 06:38:07 PST (-0800), Peter Maydell wrote:
> On Tue, 21 Jan 2020 at 23:41, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> The following changes since commit 28b58f19d269633b3d14b6aebf1e92b3cd3ab56e:
>>
>>   ui/gtk: Get display refresh rate with GDK version 3.22 or later (2020-01-16 14:03:45 +0000)
>>
>> are available in the Git repository at:
>>
>>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf1
>>
>> for you to fetch changes up to 82f014671cf057de51c4a577c9e2ad637dcec6f9:
>>
>>   target/riscv: update mstatus.SD when FS is set dirty (2020-01-16 10:03:15 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 5.0 Soft Freeze, Part 1
>>
>> This patch set contains a handful of collected fixes that I'd like to target
>> for the 5.0 soft freeze (I know that's a long way away, I just don't know what
>> else to call these):
>>
>> * A fix for a memory leak initializing the sifive_u board.
>> * Fixes to privilege mode emulation related to interrupts and fstatus.
>>
>> Notably absent is the H extension implementation.  That's pretty much reviewed,
>> but not quite ready to go yet and I didn't want to hold back these important
>> fixes.  This boots 32-bit and 64-bit Linux (buildroot this time, just for fun)
>> and passes "make check".
>
> Hi. This pull request doesn't seem to be signed with the GPG
> key that I have on record for you...

When I moved to Google I got a Yubikey and made new subkeys for it.  If I
understand correctly the new subkeys should be signed by my main key, but maybe
that didn't make it to your keyring?  I see

    $ gpg --list-keys palmer@dabbelt.com
    pub   rsa4096 2017-06-06 [SC] [expires: 2027-11-13]
          00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
    uid           [ultimate] Palmer Dabbelt <palmer@dabbelt.com>
    uid           [ultimate] Palmer Dabbelt <palmerdabbelt@google.com>
    sub   rsa4096 2017-06-06 [E]
    sub   rsa4096 2019-11-26 [S] [expires: 2024-11-24]
    sub   rsa4096 2019-11-26 [A] [expires: 2024-11-24]
    sub   rsa4096 2019-11-26 [E] [expires: 2024-11-24]

I have the master key at home, so if I didn't do this right I can re-spin
things tonight.

>
> thanks
> -- PMM

