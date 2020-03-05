Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9yM3-0000xB-8o
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 16:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1j9yM0-0000vE-Gr
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 16:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1j9yLy-0000ED-MF
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 16:48:28 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1j9yLy-0000CO-1l
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 16:48:26 -0500
Received: by mail-pj1-x1042.google.com with SMTP id cx7so154669pjb.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kK7DAQhSovPQIHP7NJRB9OBqnwzxugQmovRNvrNYNqI=;
 b=VN8EUSIHMPWB15j1ItimJ//QpF9wD1DLE15MmlC8AEGbP2rAWFuNLR8Eb0PL6LJy9g
 J0R6gR2xmHG2Mrdf5mwcUKry7FQPaDn7eq0zW1n6BSd8yCWI9sL3g8OXJKCRkYkzkXKk
 zRgV/Ye2UDBG4LAjPS1I8AHVcmi/06UcYljWJtAKkCPcHmnNAZcAgHdgaGgHCDIN40Fd
 lE2jqp1O3tlXYvNkifiIF5yUP3QHmqKeZOA95PQBo77mfoUXOLir6f71TmdgYEoKWnAf
 0GHVpGSmcjHfe8oYFV5rJ0v/H1uj8XPOVJQB/CCPxDgsnDJ09t0fIfXyBBihgL10Xt0l
 Tmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kK7DAQhSovPQIHP7NJRB9OBqnwzxugQmovRNvrNYNqI=;
 b=eS+/4RHVDmWoU+Up0pmVTLyFsv6bGdchzOQ8oWR79ZHIehToYiOgXpchKUJlth3Gta
 LUZKvlxVMXfpoVaGToVGP1qR4de+UrSC492Khxd06IK/ZiK2ReGh4+LxaMYFO4PWATYH
 DnQPIg30UbANgnLBPv27s+RpPGC6cKtvBbKDOH/KrTKLVjesa6OghEWSPov5mqsjHBZc
 fa2YepIkW4Tcj61o08DsBVBZgs/+qMOFsNaZ2CQZfhgQ/blwf02NLotI/A9uinaQzmxE
 5f95E7EjpOEk5ZPiNnj+Ha8yfPvXKjNqUlyDt4hrSdwXnkJnGsvSPGaoKae/X4WLuDXD
 JSOA==
X-Gm-Message-State: ANhLgQ1uCk7i69BbjwuajvVkr683/LtCYwhNbJ6JGgw3j7RtVpKw58tq
 tAzTl29cHWPnhMsNlQcHiNkCGw==
X-Google-Smtp-Source: ADFU+vv7aYTWfRw73C18X7VOZMfb+IPxVAwTiz/ZtqRwuno90kZJ32JAUyABbKViyNypUshEEn/k8Q==
X-Received: by 2002:a17:90a:280a:: with SMTP id
 e10mr148301pjd.145.1583444904027; 
 Thu, 05 Mar 2020 13:48:24 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id q12sm32835848pfh.158.2020.03.05.13.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 13:48:23 -0800 (PST)
Date: Thu, 05 Mar 2020 13:48:23 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 13:34:29 PST (-0800)
Subject: Re: [PATCH v1 1/1] target/riscv: Correctly implement TSR trap
In-Reply-To: <CAKmqyKPGJQMqW7ZbWBYRDUxH_PRRSvUW6tEwBAdW+MTE-RG5+w@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-11dd6ba7-bf5a-4a16-b8d7-e7b887338cf1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Thu, 05 Mar 2020 21:48:30 -0000

On Thu, 20 Feb 2020 10:41:35 PST (-0800), alistair23@gmail.com wrote:
> On Mon, Jan 20, 2020 at 9:43 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> As reported in: https://bugs.launchpad.net/qemu/+bug/1851939 we weren't
>> correctly handling illegal instructions based on the value of MSTATUS_TSR
>> and the current privledge level.
>>
>> This patch fixes the issue raised in the bug by raising an illegal
>> instruction if TSR is set and we are in S-Mode.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> @Palmer Dabbelt  Ping!

Sorry, I must have missed this.  It's in the queue (with the reviews as
collected by patchwork).

Thanks!

>
> Alistair
>
>> ---
>>  target/riscv/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> index 331cc36232..eed8eea6f2 100644
>> --- a/target/riscv/op_helper.c
>> +++ b/target/riscv/op_helper.c
>> @@ -83,7 +83,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>>      }
>>
>>      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
>> -        get_field(env->mstatus, MSTATUS_TSR)) {
>> +        get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
>>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>>      }
>>
>> --
>> 2.24.1
>>

