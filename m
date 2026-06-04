Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D61CD6E60
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 01:10:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUwb4-0006Ya-E0; Wed, 03 Jun 2026 21:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUwb1-0006Tw-8O
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 21:10:07 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUwax-0005hJ-K0
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 21:10:06 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7e266714bd3so2159417b3.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jun 2026 18:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780535400; cv=none;
 d=google.com; s=arc-20240605;
 b=SH3XMHQBU0gFXZBjhZRmGkrlxzpOGvoG5qyIjHfnUI6StuPBXtR65v2EqP6+EDCNkC
 lGkHGpp6sheOz0Mn+oCbZ1naFTESU4oEPPzfd2tCIdw7UlOx8sdpDikBvjZOJgGjBzKr
 PMITIahFll/3hbBbo1gzWumc9RUO4GY4HMZb/eW7MHiMX4EwNvt3Pvki4kpAl7H6K/Y6
 RIQcRW99tbDgmm6j7wu3IAZqUSXW+mYqxmv/kUzSGDvVp9sXUuZCXON8gX/EnD+Ax/3n
 lo1zeraxsQSPd7XyjHO6Mhdvq4+J3eUzMQoudzMmKqNFp/8HOCoF/3Vqw5Olbj/Q+VyY
 sWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fIed5qgpa5dwUJMxn35bujyif9xQg3tYkXlsm1gXA+U=;
 fh=2sw2fdJZn/L/2+N5Ud2RTAwr3Z95izLopjZFOwMWovE=;
 b=fhDNOGVv+n9/UQTIBLwBicQ1bs+VuJ/lRazSHpgqyOlwA75hRmxXrC8aVmSX3AJn6d
 vkj8GSVX+muOeAD7gLQciFNxTVsIQ8My6RZeT/hVRQ5Ts3eUqWATUvWuAOigor3awpnc
 pxGPXvUAvEtDGIX9dcz7zMlhe9dNV/kdpjFU9Q9Pm+OLSuFTS9sZX5Y83BKRD36zXIdw
 ufROZpM+pElE0PMg3DgYc9g5R6eoVEypL055rEgMFXRKXf+Fe+NUGEYyvc2zYz028PZY
 2TV7hKJqRvFq/PBAXt/DxioVasi4HSlqTJi8TG1ySRz509a3kHRT0qdETrxcS/BHK81Y
 M6rQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1780535400; x=1781140200; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fIed5qgpa5dwUJMxn35bujyif9xQg3tYkXlsm1gXA+U=;
 b=mqQzAkN1nxocLHwIyNA+VGaAJG2nRAXWv8Yq8XP/A7XYVwlYiGvaykazN3la1CLxAC
 q54Gw4g4IQwJ3q8Pmv0ZOS2PhS2i0aZRG2pmG930H+UUHxQJs68f2O40mgSHMuypcuNh
 fXOjaVCYqAXzY/JmO30RZCvtl0tZReVLgOLyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780535400; x=1781140200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIed5qgpa5dwUJMxn35bujyif9xQg3tYkXlsm1gXA+U=;
 b=XxfWlNEwirjwV976nftHLQUTFarl6fsrCg6KpBtG3b2tBmiC0X5NM5nsDUdYO07ayk
 8sMIe5W4VHm7lg4XUOlP2Mh0oKZvFIe93RS9Swx/qwUWDdlFXpf2OIPwX4VGDkxTMQaQ
 8aSW4s1RItYnnTdvl8SfqMkJ+f9lKYhXqWH8HDFJrbDxbw+go/NuZMOlZMIY4E1K1/6e
 ZK0QRZK1pSiGJcoHOaBi7F7+c4qtzowDHU+TnJqhiNzCBmz1O3cBYiNFz5M6vNG9Af9U
 JC+cdjGQoMO9pDzG6qNmGey5/DjjcKpc2Cx1o+ugrq5tm2bnkCD4A/ftb7F9a2S8SAX/
 TYOg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+k0pVGYhZ4ITuCR0KkE1BnOMjKYz1gUXhuV3kpDQV+Pgs2dDixcRIjKxq6xCvhqTIwWq+kvwRhR36D@nongnu.org
X-Gm-Message-State: AOJu0YybpMrIQy6ACEw2jbN7FYPnDnzJ6mpUJoc1uyNoPugktXdfcx6Y
 mnt/l+iB09HJl+wIBeOK3UqkdpL5jvOk/AWh8Vi1Vx0VeAT6wz6f5LaldpUt/dMw1NSV3eh+4F3
 X5/UMKEGj46cJ4zuNEqMa2MaZPI3p6iw=
X-Gm-Gg: Acq92OEuXQutj4fZoQANcRtcnvBWCb255bzvHA6FRNBLBk/dJBdvhprKW3e6oWjzN2W
 vXkPMcSImO0jz9bkns9vjIki5cOL9Ftv1pPJWrn1n4j3ln6sDFFhdWrrBM6SEfgF/Msu2tYAMnO
 9rUXjRhvPS4iJR4nEX6LBFewvIJBgzo/6XYsTylMwmQR+8zzVkySX7UjyRBCcZfNJNkQsStvWhy
 wP+F3Y9/5nClT78x/+9UF2Q1h8cO/xkynnx2N0B5ngXnZvxP+K/6qZZ9dr95JlZeOYCEs3yDr07
 8drhtHnlh7GIhkjzx3lTc3SHbKp/7+Z2eNdmN2lgWU3j2LwEfwnD7zHNnBwdug64L5zRKs+GGjk
 xt7WN+REGlySYhYgl4xMhBpolHlvRKhrGuvE=
X-Received: by 2002:a05:690c:3682:b0:7bd:577d:7828 with SMTP id
 00721157ae682-7ea4987b42cmr53589307b3.31.1780535399639; Wed, 03 Jun 2026
 18:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260528131214.2251075-1-daniel.barboza@oss.qualcomm.com>
 <20260528131214.2251075-2-daniel.barboza@oss.qualcomm.com>
 <ahz7-1OomsZTMIz2@ChaodeMacBook-Pro.local>
 <b063eb61-a246-4f10-bac2-ee9272afcd2f@oss.qualcomm.com>
In-Reply-To: <b063eb61-a246-4f10-bac2-ee9272afcd2f@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Jun 2026 10:39:48 +0930
X-Gm-Features: AVHnY4LcozYN8wqknDYQoC6wRDK9EI5pMFa79rlcsdEesr8BW8hKWj7h18o_yrU
Message-ID: <CACPK8XcjabfXiDLNm5WoaypfHKbGRggqLL3gob2FWz2TZf0ZZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: deprecate 'debug' CPU property and
 Debug 0.13
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: Chao Liu <chao.liu.zevorn@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 Tao Tang <tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=joel.stan@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 4 Jun 2026 at 06:27, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 6/1/2026 1:04 AM, Chao Liu wrote:
> > Hi Daniel,
> >
> > On Thu, May 28, 2026 at 10:12:14AM +0800, Daniel Henrique Barboza wrote:
> >> Starting on commit f31ba686a9 ("target/riscv/cpu.c: add 'sdtrig' in
> >> riscv,isa') the 'debug' flag has been used as an alias for 'sdtrig' that
> >> is, for now, compliant with Debug 0.13 that was ratified 8 years go.
> >>
> >> We're going to add more debug trigger extensions, e.g. 'sdext' [1].
> >> Thing is that 'sdext' and all other extensions that will follow are now
> >> adherent to Debug 1.0, ratified Dec 2022.  And so it happens that Debug
> >> 1.0 and 0.13 are not compatible with each other.  This makes support new
> >> Debug 1.0 extensions like 'sdext' harder because we would need two
> >> independent code bases for each.
> >>
> >> We consider that most of the RVI ecosystem already moved on to Debug
> >> 1.0 and is now going towards the extended Debug 1.0 extensions, and we
> >> should follow suit.  And the best way to do that is to leave Debug 0.13
> >> behind, by deprecating its 'debug' flag and making it an alias for
> >> 'sdtrig' that will eventually move on to Debug 1.0.
> >>
> >> The following changes are made:
> >>
> >> - 'ext_sdtrig' flag was added in cpu->cfg. 'debug' flag was removed from
> >>    cpu->cfg;
> >> - All occurrences of cpu->cfg.debug were replaced to 'ext_sdtrig';
> >> - Two explicit getters and setters for the 'debug' property were added.
> >>    The property will simply get/set ext_sdtrig;
> >> - vmstate_debug was renamed to vmstate_sdtrig. We're aware that this
> >>    will impact migration between QEMU 10.2 to newer versions, but we're
> >>    still in a point where the migration break cost isn't big enough to
> >>    justify adding migration compatibility scaffolding.
> >>
> >> Finally, deprecated.rst was updated to deprecate 'debug' and inform that
> >> it will be now interpreted as an alias of 'sdtrig', which is now going
> >> to be compliant with Debug 1.0.
> >>
> >
> > This patch conflicts with Alistair's riscv-to-apply.next branch.
> >
> > f71708fedf target/riscv/tcg: disable svnapot if satp_mode < sv39
>
> Based on recent discussions with Alistair (check the "QEMU RISC-V Call" thread)
> seems like we're postponing this change because there seems to be interest
> in keeping the 'debug' flag around, together with the 'sdtrig' extension that
> we need for your 'sdext' extension (and for the riscv-server-ref board).  Seems
> like someone is going to send patches making it possible.

I think this was a reference to Nick's work (I got credit for a bunch
of things Nick said on the call, so swap out "Joel" for "Nick" in some
places):

 [RFC PATCH 00/25] target/riscv/debug: Sdtrig fixes and TT Ascalon support
 https://lore.kernel.org/qemu-devel/20260114044701.1173347-1-npiggin@gmail.com/

I encouraged Nick to get it out on the list early, to make others
aware of the work that had been done.
He mentioned there's some further improvements to make, I'll let him
fill you in.

Cheers,

Joel

