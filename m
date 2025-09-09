Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D5CAC583
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 12:37:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvxau-0007vR-5u; Tue, 09 Sep 2025 08:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxar-0007v4-15
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:37:05 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxam-0000Df-Gw
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:37:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b4c72885c8bso4521296a12.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Sep 2025 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757421416; x=1758026216; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mPyGQ6358lK6j1oEuTF1y5eOpaLNaFJppXt5tnxqm04=;
 b=EJA0LjeRotW20L6fRYsltHzxX+JQSRRTXc9+iTRm9LXgPOxIOX7dB4YbiHlAJ4wVh/
 yKmbGmRTFDpqPqtibzFk9dJMoV0XNfH3DyKXxB0ZhS1o5u3sPMRuf1whsQvY49xYlQ6o
 zMc28X1vtvxIH3Xxf/59gXuhtgCs4kfT1VJBiY9ca4DfAsKN8Kuic62BUMhQC9PUvhmx
 Q4lsqjSPdYLaX6yW1oKAeFDCAfzivV9X6B4/CsilxOU1RsAwMsfq93oajPPgCFuw/ntm
 ff0B/X2MAYKWMthBRdOB4t9SkLgghUjCObfvD2DgBpx6X0hxQK0YMEX4WhRDj53E+ZJb
 uMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757421416; x=1758026216;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mPyGQ6358lK6j1oEuTF1y5eOpaLNaFJppXt5tnxqm04=;
 b=Mz2caM64b9bGkMgwviv7qxOlPptY3flU8ydzetUrAmbhim/m6j1Lg43Ri/nkO9TDOY
 0601VtPLhorUsQdFWbDHjHnZqzXeRIzmKtQsclp8sQK2B1byDaHWgumhBO4DWE4v6iGK
 jgW8cMv5dkHjv/SHyRVlVx6bUj4pqXVfLVCN7KdDUdbLiHVdLH1XCkPMvgz+8zh438yH
 gh4MNnFclXqCxBNL8DG3dB1QzqdisoUjXfNyrAgZfjl8Pwo5z6v0qg69eYWlblFJNuFG
 1gLkX2srl5beKrUXJkTPzfSZGf2bB8WjYgKPYvHj7pCLhmecLmT1W8exQyNfRjcKCbxs
 dWog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEPQNdiTbNM9r9LED2uyOXAKyXkZBCNVwxK1s+h04FpSkAjkPjIKC9IqQ9YwmOAWE8xjbVdz/NLVfw@nongnu.org
X-Gm-Message-State: AOJu0YxP0nUYmJvB0VHb9FTUaXpFI+Iw6f3nQHmg2ZqK4FXUXG4bqBu1
 GblivkO/2WMe6n6mBMXovXbvQD4N+BhjBCDReR+4fxrQy8OFk6Zw6/CQ/BQhbmkLRQ8=
X-Gm-Gg: ASbGncvTsmMU282chz1qd4y1gIDs1C03UML+xWr/haVWioj1BUDLO2LUeY2v1RjGvRh
 O/ny8nG1z+RQgJfGK8CRRKhjOnkUZmop2wqq0p834mtURXlIjaFdEToZtgnew80V4ylkpTmPtpO
 Xb+z06Q4R6uJZaOjSmX9inlyJg0RJwfMxmtPjAOWcJx/o2vK50pDhqzTGFi9RsoFfytYsO3Xk6q
 aEdsPg4K0EwS4zBG9Sst4X81x71Vox5+ER4Z1xMnccP7ryAkG3GYI9aEwE8cPLOMP39yyaMsWAo
 EAqJaMkXVPXbfJtqIwA48tZpVMxdUV6Wv+Zsk7A39j6WE/dGN52W3mySRdwyrhOvNKt13aiMELV
 9Ar634+EXuykSbtn6gBzxekFczoA9Arg3ORkJ
X-Google-Smtp-Source: AGHT+IHpZD6iVITVFteapE5Wsluy9IMEJ5Ar0efHpX6dyD5NSNzwt1xKf4+eXxnRzTM+i8FtMyeadQ==
X-Received: by 2002:a17:902:e848:b0:246:d70e:ea82 with SMTP id
 d9443c01a7336-2516ef591e9mr193817465ad.5.1757421416293; 
 Tue, 09 Sep 2025 05:36:56 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b14e1b097sm202135235ad.21.2025.09.09.05.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 05:36:55 -0700 (PDT)
Message-ID: <7f8a9622-cc0d-43f5-92d2-7e6d925e7546@ventanamicro.com>
Date: Tue, 9 Sep 2025 09:36:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/intc: Save time_delta in RISC-V mtimer VMState
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com>
 <20250909-timers-v1-1-7ee18a9d8f4b@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909-timers-v1-1-7ee18a9d8f4b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/9/25 6:46 AM, TANG Tiancheng wrote:
> In QEMU's RISC-V ACLINT timer model, 'mtime' is not stored directly as a
> state variable. It is computed on demand as:
> 
>      mtime = rtc_r + time_delta
> 
> where:
> - 'rtc_r' is the current VM virtual time (in ticks) obtained via
>    cpu_riscv_read_rtc_raw() from QEMU_CLOCK_VIRTUAL.
> - 'time_delta' is an offset applied when the guest writes a new 'mtime'
>    value via riscv_aclint_mtimer_write():
> 
>      time_delta = value - rtc_r
> 
> Under this design, 'rtc_r' is assumed to be monotonically increasing
> during VM execution. Even if the guest writes an 'mtime' value smaller
> than the current one (making 'time_delta' negative in signed arithmetic,
> or underflow in unsigned arithmetic), the computed 'mtime' remains
> correct because 'rtc_r_new > rtc_r_old':
> 
>      mtime_new = rtc_r_new + (value - rtc_r_old)
> 
> However, this monotonicity assumption breaks on snapshot load.
> 
> Before restoring a snapshot, QEMU resets the guest, which calls
> riscv_aclint_mtimer_reset_enter() to set 'mtime' to 0 and recompute
> 'time_delta' as:
> 
>      time_delta = 0 - rtc_r_reset
> 
> Here, the time_delta differs from the value that was present when the
> snapshot was saved. As a result, subsequent reads produce a fixed offset
> from the true mtime.
> 
> This can be observed with the 'date' command inside the guest: after loading
> a snapshot, the reported time appears "frozen" at the save point, and only
> resumes correctly after the guest has run long enough to compensate for the
> erroneous offset.
> 
> The fix is to treat 'time_delta' as part of the device's migratable
> state and save/restore it via vmstate. This preserves the correct
> relation between 'rtc_r' and 'mtime' across snapshot save/load, ensuring
> 'mtime' continues incrementing from the precise saved value after
> restore.
> 
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/intc/riscv_aclint.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 4623cfa029365c6cbdead4bd4a9f0d8b9e88b939..318a9c8248432a8cd4c3f3fa990739917ecf7ca1 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -323,9 +323,10 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
>   
>   static const VMStateDescription vmstate_riscv_mtimer = {
>       .name = "riscv_mtimer",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>       .fields = (const VMStateField[]) {
> +            VMSTATE_UINT64(time_delta, RISCVAclintMTimerState),
>               VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
>                                     num_harts, 0,
>                                     vmstate_info_uint64, uint64_t),
> 


