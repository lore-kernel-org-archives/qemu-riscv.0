Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jX5nz-0007QN-Kf
	for mharc-qemu-riscv@gnu.org; Fri, 08 May 2020 12:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jX5ny-0007Ow-AM
 for qemu-riscv@nongnu.org; Fri, 08 May 2020 12:24:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33502
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jX5nq-0003mN-Eo
 for qemu-riscv@nongnu.org; Fri, 08 May 2020 12:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588955085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N16PM56c20HjCHU6EZjPv7GwWM6Oo3yOuvlJmbCHhxw=;
 b=QVoHodmbPOAz0tUIrhsus1P/dTvdgnVpcD2N7FgcBLkHjvq8EgmdAY11TxYt7mZLOzIHLe
 J9Ftm+cznebw6ABLy+dqbysSwI9sKpNOV4CNwdFEIn5fwdrfTsq1iU1eJbPXHf0oFDSx2x
 CM8wq+UfBTtrUQ5Qy10bae82rRx2VlU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-h4oL7EwLPi-Vq_VY7Ja5dA-1; Fri, 08 May 2020 12:24:39 -0400
X-MC-Unique: h4oL7EwLPi-Vq_VY7Ja5dA-1
Received: by mail-wr1-f72.google.com with SMTP id z5so1112798wrt.17
 for <qemu-riscv@nongnu.org>; Fri, 08 May 2020 09:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N16PM56c20HjCHU6EZjPv7GwWM6Oo3yOuvlJmbCHhxw=;
 b=sIJTEvMRSCCZIJYIxr6YQv5RF+MXUxMpWGmQChRr6ze1gWPtFEcq4DpJ2mOZ3YUL9v
 /zSp7ITtEOrhsygURlkvrdyzjyFmBbkFaZaFyUjhDL9oKFUbaiOo4QMCKvJ/zoHtACTz
 K+yYhTL9bA6svl9nJHqIpH4l/KffBylcgXdVwezHLRPQvlPh4DkAMCVhPal2efnbVyaW
 eF4zB+0wG+P55TdezGpoBJNGckCJ2g54+9wKDz4xlx64xGgVVqHM02LJfO43MHrcuX3N
 6lSHhyfkG+eT6oItW5z5ufXVNhrGFdzWIx40Pe24dQPIbnUEs4m+iGrbZqBNkQkJqpmn
 p84A==
X-Gm-Message-State: AGi0PuYOwkGLYu9oIlKBegplF6EuSkIql4oYva7sM3Tyyyon6iT9Oz0Y
 v8TeRiRThQwdUOXTeE/QD75cklmieJAhDuHjuANhj2sBTmDWnw8i7Vu0Xyw6zXghsZYZhmdV49f
 HvCXHJqaHaP/nLhM=
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr18112733wmb.156.1588955077782; 
 Fri, 08 May 2020 09:24:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKAp90iCgoFfDb77/IePwZh6jVXnTtXgZSwrIbiGSq2NaoUT9Y1Pzpt+rmCaRKfutfkjwU/FA==
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr18112700wmb.156.1588955077442; 
 Fri, 08 May 2020 09:24:37 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h137sm23015935wme.0.2020.05.08.09.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 09:24:36 -0700 (PDT)
Subject: Re: [PATCH v3 00/12] user-mode: Prune build dependencies (part 1)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200504152922.21365-1-philmd@redhat.com>
 <7f19b263-5493-779b-cf86-b0499c7dc80d@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ecac9003-ef59-8cca-3aec-6aa26a9e092b@redhat.com>
Date: Fri, 8 May 2020 18:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f19b263-5493-779b-cf86-b0499c7dc80d@vivier.eu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 11:31:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 08 May 2020 16:24:54 -0000

On 5/5/20 10:33 AM, Laurent Vivier wrote:
> Le 04/05/2020 à 17:29, Philippe Mathieu-Daudé a écrit :
>> This is the first part of a series reducing user-mode
>> dependencies. By stripping out unused code, the build
>> and testing time is reduced (as is space used by objects).
>>
>> Part 1 (generic):
>> - reduce user-mode object list
>> - remove some migration code from user-mode
>> - remove cpu_get_crash_info()
>>
>> This series is fully reviewed.
>>
>> Since v2:
>> - Rebased due to conflict when applying patch:
>>    "util/Makefile: Reduce the user-mode object list"
>>    because commit 01ef6b9e4e modified util/Makefile.objs:
>>    "linux-user: factor out reading of /proc/self/maps"
>>
>> Since v1:
>> - Addressed Laurent/Richard review comments
>> - Removed 'exec: Drop redundant #ifdeffery'
>> - Removed 'target: Restrict write_elfXX_note() handlers to system-mode'
>>
>> $ git backport-diff -u v1 -r v2
>> Key:
>> [----] : patches are identical
>> [####] : number of functional differences between upstream/downstream patch
>> [down] : patch is downstream-only
>> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
>>
>> 001/12:[----] [--] 'Makefile: Only build virtiofsd if system-mode is enabled'
>> 002/12:[----] [--] 'configure: Avoid building TCG when not needed'
>> 003/12:[----] [--] 'tests/Makefile: Only display TCG-related tests when TCG is available'
>> 004/12:[----] [--] 'tests/Makefile: Restrict some softmmu-only tests'
>> 005/12:[----] [-C] 'util/Makefile: Reduce the user-mode object list'
>> 006/12:[----] [--] 'stubs/Makefile: Reduce the user-mode object list'
>> 007/12:[----] [--] 'target/riscv/cpu: Restrict CPU migration to system-mode'
>> 008/12:[----] [--] 'exec: Assert CPU migration is not used on user-only build'
>> 009/12:[----] [--] 'arch_init: Remove unused 'qapi-commands-misc.h' include'
>> 010/12:[----] [--] 'target/i386: Restrict CpuClass::get_crash_info() to system-mode'
>> 011/12:[----] [--] 'target/s390x: Restrict CpuClass::get_crash_info() to system-mode'
>> 012/12:[----] [--] 'hw/core: Restrict CpuClass::get_crash_info() to system-mode'
>>
>> Philippe Mathieu-Daudé (12):
>>    Makefile: Only build virtiofsd if system-mode is enabled
>>    configure: Avoid building TCG when not needed
>>    tests/Makefile: Only display TCG-related tests when TCG is available
>>    tests/Makefile: Restrict some softmmu-only tests
>>    util/Makefile: Reduce the user-mode object list
>>    stubs/Makefile: Reduce the user-mode object list
>>    target/riscv/cpu: Restrict CPU migration to system-mode
>>    exec: Assert CPU migration is not used on user-only build
>>    arch_init: Remove unused 'qapi-commands-misc.h' include
>>    target/i386: Restrict CpuClass::get_crash_info() to system-mode
>>    target/s390x: Restrict CpuClass::get_crash_info() to system-mode
>>    hw/core: Restrict CpuClass::get_crash_info() to system-mode
>>
>>   configure              |  4 +++
>>   Makefile               |  2 +-
>>   include/hw/core/cpu.h  |  7 ++++-
>>   arch_init.c            |  1 -
>>   exec.c                 |  4 ++-
>>   hw/core/cpu.c          |  2 ++
>>   target/i386/cpu.c      |  6 ++++-
>>   target/riscv/cpu.c     |  6 +++--
>>   target/s390x/cpu.c     | 12 ++++-----
>>   stubs/Makefile.objs    | 52 +++++++++++++++++++++----------------
>>   tests/Makefile.include | 18 +++++++------
>>   util/Makefile.objs     | 59 +++++++++++++++++++++++++++---------------
>>   12 files changed, 108 insertions(+), 65 deletions(-)
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Tested-by: Laurent Vivier <laurent@vivier.eu>

Thanks!

Paolo, since it is a bit of everything, do you mind taking this series?
For your convenience, you can use this link with all the patches and the 
tags already applied at once! :p
https://patchew.org/QEMU/20200504152922.21365-1-philmd@redhat.com/mbox

Regards,

Phil.


