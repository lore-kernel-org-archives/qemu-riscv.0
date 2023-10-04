Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718FDE7B616
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:42:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo289-0007CO-D3; Wed, 04 Oct 2023 09:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1qo287-0007B7-Sh; Wed, 04 Oct 2023 09:41:35 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1qo286-00079S-8B; Wed, 04 Oct 2023 09:41:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3A4E2184D;
 Wed,  4 Oct 2023 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696426889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRHGFsWWsaMiT4za2Ha7olylZlczXbGP/cTLlISMQZw=;
 b=BVRh0+8PS/DzVfI6XvSrS4NzPDkbAeYqH5BwoKH6dPpV/exxG38RV48fBqJ0I83nBoHyJb
 I5/x7tYpW+1eZRIlcpwo4tYt2hlpQgL1qCVtzLJrNxMvcox51VAYfEPoxd6EMuVG0FC2us
 RwQl/oPFlSzE80663kq2rlQg4aLMf3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696426889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRHGFsWWsaMiT4za2Ha7olylZlczXbGP/cTLlISMQZw=;
 b=E+t5OJRN/YVcrUUHu0TAdojbDPrvz/3Y+A4PgmpLTlBjOtzGo1R1I+gjN5cnXMDLcd+/Df
 G+BdarjhPQ4yU8DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63D29139F9;
 Wed,  4 Oct 2023 13:41:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RD6BFolrHWWwXgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 04 Oct 2023 13:41:29 +0000
Message-ID: <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
Date: Wed, 4 Oct 2023 15:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.528,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 10/4/23 14:37, Thomas Huth wrote:
> On 04/10/2023 14.33, Daniel P. Berrangé wrote:
>> On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
>>> This series finishes the cleanup which remove the confusion
>>> of using 'softmmu' when we really mean 'system emulation',
>>> as opposition to 'user emulation'.
>>
>> Am I mis-understanding what you mean by 'finishes' here, as
>> I see many references to softmmu remaining
>>
>>    $ git grep softmmu | wc -l
>>    270
>>
>> In particular under configs/
>>
>> I was also hoping it meant that we'd be changing configure
>> to allow
>>
>>      configure --target-list=x86_64-system
>>
>> though the lazy side of me would like
>>
>>      configure --target-list=x86_64-vm
>>
>> for less typing
> 
> Maybe we should also bikeshed about the naming first... "system" is a quite 
> overloaded word in this context already, and "vm" sounds rather like 
> hardware-accelerated stuff ... what about using something like "sysemu"? Or 
> "fullsys" for "full system emulation" (in contrast to "user space"-only 
> emulation)?
> 
>   Thomas
> 
> 

Just my 2c, to me "system" is the only word that makes sense here, even from a purely user perspective.

We already have exposed "system" to the user as a way to mean this, as in:

./configure --enable-system
./configure --disable-system

and if everything is renamed from softmmu to system where it makes sense in the code,
it's the best option for development as well in my view.

Thanks,

Claudio



