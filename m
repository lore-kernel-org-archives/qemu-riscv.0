Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxJQ1-0001gx-DY
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 17:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxDfK-0007su-JZ
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 11:27:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxDfJ-0001yS-NG
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 11:27:10 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gxDfH-0000yr-94; Fri, 22 Feb 2019 11:27:07 -0500
Received: by mail-wm1-x342.google.com with SMTP id z84so2506029wmg.4;
	Fri, 22 Feb 2019 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zAjqBI3q8zL7QBbqhOEMCKvltstaHAt4t7hKUSm6HTU=;
	b=pAB8+gKvoxaiklBiyRATMIKlX0UydbyBcqIru4judgMwN5BO3jmHFSFqDbSaR/e+JE
	tiFSCVRPpmcH2+QGYnIgBENOelSwsqyMoDC5EgjTEWF0ncH12fyeBHVEhuXFPJtKKdhl
	8rk3zevdGppTEZVES3cwzZMK37rU9Lw6ePFDj9WiJbLk8Huo/lbQvkJmKOUrHH3n6YPI
	dmoqtIOumtyjCQKqTnTEPIZjqZMjERNKdYZ35ePtk1DJtuaIoOapaqUQIi89bpde8c6h
	31EnqyJoVp8oxQKW2HyJi5NAdhbtnGLCtL9umnI34pWiasE3w1OIo31YMv1YqfJJaQQ1
	RcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zAjqBI3q8zL7QBbqhOEMCKvltstaHAt4t7hKUSm6HTU=;
	b=bHb61N7RHQVZHN9JNhrmwVLk6wbun9RFqM48AeMhWNr4RWCB50Om376zfAjIBUUAfl
	YBvK/b0yy6PxkLMyVO6CUJqP1NyHnUuu1wK7C+yTBmI+CZnACEPnUpy7eNhPsD/AC9J9
	RYNBmDE2y1bTNe3v1dbhhsnR5Y/b3tW8YCHwrzYvLc3eC8UwnkJtU8M2WHCRqW+7CEzr
	dN+paRlrwlKY6JFFA/YYWmHfeBzGyYNun+AKaa3Wr8NARXIM/l9HdlvbvsEXSVsTWICC
	quhyGbsKBLXe9MmQA0mhmPAKb3vslMaYNCd9m0eWZ+UsDpoMds3k6EWSi/j1LqW4tP/D
	X26Q==
X-Gm-Message-State: AHQUAubzueQNLTrDqNd8EOFt7yFVFH6yLCur7CGxLaDWT6C43YrB6i4G
	sJLJ9Wa5EnYn7fIvfGRdW3z97YCy6J4=
X-Google-Smtp-Source: AHgI3IbndlBLXtnjiZXkxuEtgsfpecmmtpvnmIupndcSXj2PqcDyUpL+EatPxV5WqjqFfpLXoauzZg==
X-Received: by 2002:a1c:f20a:: with SMTP id s10mr2861952wmc.123.1550852773856; 
	Fri, 22 Feb 2019 08:26:13 -0800 (PST)
Received: from egc-ahmeda-lt.mgc.mentorg.com ([41.235.100.117])
	by smtp.gmail.com with ESMTPSA id t9sm2058102wrx.73.2019.02.22.08.26.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 08:26:12 -0800 (PST)
From: amagdy.afifi@gmail.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, mjc@sifive.com, palmer@sifive.com,
	Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
	kbastian@mail.uni-paderborn.de, amagdy.afifi@gmail.com
Date: Fri, 22 Feb 2019 18:25:54 +0200
Message-Id: <20190222162555.13764-1-amagdy.afifi@gmail.com>
X-Mailer: git-send-email 2.16.2.windows.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
X-Mailman-Approved-At: Fri, 22 Feb 2019 17:35:44 -0500
Subject: [Qemu-riscv] Add proper alignment check and pending 'C' extension
 for riscv
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2019 16:27:11 -0000


Dear All,

I'm submiting this patch to properly check the next instruction alignment and scheduale compression extenstion enable upon 'MISA' register writes to later aligned instruction through exporting next instruction 'pc' to riscv cpu state

Thanks,
Ahmed

