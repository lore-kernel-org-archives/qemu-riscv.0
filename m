Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRAXZ-0007VY-2e
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 04:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRAXX-0007SQ-4D
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 04:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRAXW-0001uS-Fn
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 04:15:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25087
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRAXW-0001sJ-1E
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 04:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587543325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LwLu5BQin5tmZUXwR53/MiinefBza4g0u4Mv7RPekc=;
 b=gR2qfOskaqUfjumr9+PwkIqkQnVK0uqYR7D1kGzaE+6u0Pea6bDtTZAyXqKzY5fYDPt76y
 hgLlx8hYobEdh5AsF4zMmQ3PY/CvW+LIAnZDsBBQX2pYQ+OFO6MtS3WXz1ednw8NMpfGRt
 4RNfFxDAhTzRSgDbZ9XHLQgPXXxpe8g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-sx8CY-E9OG-sr2VUlsDlWQ-1; Wed, 22 Apr 2020 04:15:11 -0400
X-MC-Unique: sx8CY-E9OG-sr2VUlsDlWQ-1
Received: by mail-wm1-f72.google.com with SMTP id n17so488291wmi.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Apr 2020 01:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+LwLu5BQin5tmZUXwR53/MiinefBza4g0u4Mv7RPekc=;
 b=cTHHFXcIa+96ZqkxWqyzRactgxLaD8BGP3zpyM+Cwzp56OCk/VzmxQWfV+rNgFAnXS
 /dMSdsIo/4sXie4BI57jASl6G/cJ+j1jKW9Pjta5/yzPNePP0Mr2UrsYrTMDSthDQ5Mi
 v2hFHQShh/xVLAdYqByga5M2bY7pr4BFIqIV3njR+5rHNcz+ztao1jfaSsfb+jTsHV9J
 5mRqnItLl5ZasdQht1qK9piHoqV1hx2hTWCml+BZUUQq2DbSWkvQrh+ZOBFQUusZOP5z
 X+WyfGpjFpOLs+oP83/xmO8XAFOmY1/BKfPk/rAZ0UiBtEw25mB/z4kDHZj6P5RzLD7v
 Pd6A==
X-Gm-Message-State: AGi0Pub6/dJxzweyo8y0XFIfhPxPFbj5kIOykoaj1JawXloVGrzJE53v
 wYDkROPMMqXK9VY94dRrggMBUoHrHFoeH3PW6xcHxYB73DWwW8d2vu+ibWd7ByWIkigkWIsFV24
 VcBW8jOxlB+tFjv4=
X-Received: by 2002:a5d:5224:: with SMTP id i4mr28291280wra.1.1587543310046;
 Wed, 22 Apr 2020 01:15:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypJG2+yCSq8lRG9pgd/x0hVpvxjyJfNnTEuzna1LIOn0QWqth7zGaXeSM/7Pr7sMcuq/qbxrRQ==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr28291262wra.1.1587543309817;
 Wed, 22 Apr 2020 01:15:09 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id k184sm6808336wmf.9.2020.04.22.01.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 01:15:09 -0700 (PDT)
Subject: Re: [PATCH] roms: opensbi: Upgrade from v0.6 to v0.7
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <1587389038-1549-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKMzUzHC1FhV6ccjswjRvQH_h6DuUwEWjte4CAEmxPOKDg@mail.gmail.com>
 <CAEUhbmUTEVPF6f91SqrXL-_M-G_Jg2D29cBjbCs1YBGm2fk6QA@mail.gmail.com>
 <CAEUhbmWsNmTTTFz66M4sK-pEtEMOhfoYzCHYVyEF4AJ2X02twA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bd7da39b-4ece-7e72-a0a0-1d401c3b8c34@redhat.com>
Date: Wed, 22 Apr 2020 10:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWsNmTTTFz66M4sK-pEtEMOhfoYzCHYVyEF4AJ2X02twA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 22 Apr 2020 08:15:27 -0000

On 4/22/20 3:30 AM, Bin Meng wrote:
> Hi Alistair,
> 
> On Tue, Apr 21, 2020 at 9:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Alistair,
>>
>> On Tue, Apr 21, 2020 at 2:41 AM Alistair Francis <alistair23@gmail.com> wrote:
>>>
>>> On Mon, Apr 20, 2020 at 6:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> Upgrade OpenSBI from v0.6 to v0.7 and the pre-built bios images.
>>>>
>>>> The v0.7 release includes the following commits:
>>>>
>>>> f64f4b9 lib: Add a new platform feature to bringup secondary harts
>>>> b677a9b lib: Implement hart hotplug
>>>> 5b48240 lib: Add possible hart status values
>>>> e3f69fc lib: Implement Hart State Management (HSM) SBI extension
>>>> 6704216 lib: Check MSIP bit after returning from WFI
[...]
>>>> 6c7922e lib: Support vector extension
>>>> 615587c docs: Update README about supported SBI versions
>>>> 66d0184 lib: Allow overriding SBI implementation ID
>>>> 9f1b72c include: Bump-up version to 0.7

The git-short-log in the commit message is very appreciated, thanks.

>>>>
>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>
>>> Can you share a git branch with this patch? From memory these binary
>>> patches don't apply well from emails.

Indeed. These patches are good candidate to use the 'git-format-patch 
--no-binary' option with a link to a git repository to fetch the full 
commit:

   --no-binary
     Do not output contents of changes in binary files,
     instead display a notice that those files changed.
     Patches generated using this option cannot be applied
     properly, but they are still useful for code review.

>>
>> Sure. Please grab the bits from http://github.com/lbmeng/qemu opensbi branch.
>>
>> You can also use patchwork to help with your custodian work.
>> http://patchwork.ozlabs.org/project/qemu-devel/patch/1587389038-1549-1-git-send-email-bmeng.cn@gmail.com/
>>
>> Click on the "mbox" button to download the patch and apply it.
> 
> Will this be 5.0, or 5.1?

Unlikely 5.1, too late.

> 
> Regards,
> Bin
> 


